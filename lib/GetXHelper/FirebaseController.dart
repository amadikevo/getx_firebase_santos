import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:getx_firebase_santos/Screens/Dashboard.dart';
import 'package:getx_firebase_santos/Screens/LoginPage.dart';
import 'package:get/get.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:velocity_x/velocity_x.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';

class FirebaseController extends GetxController {
  FirebaseAuth _auth = FirebaseAuth.instance;

  GoogleSignIn googleSignIn = GoogleSignIn(scopes: ['email']);
  FacebookLogin facebookSignIn = new FacebookLogin();
  Rxn<User> _firebaseUser = Rxn<User>();

  get user => _firebaseUser.value?.email;
  get imageUrl => _firebaseUser.value?.photoURL;

  @override
  // ignore: must_call_super
  void onInit() {
    _firebaseUser.bindStream(_auth.authStateChanges());
    print("Auth Change: ${_auth.currentUser}");
  }

  // function to createuser, login and sign out user
  createUser(
      {String firstName,
      String lastName,
      String email,
      String password}) async {
    print("Hello");
    await _auth
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) {
      print(value.user.email);
      Get.offAll(LoginPage());
    }).catchError(
      (error) => Get.snackbar("Error while creating account", error.message),
    );
  }

  void login(String email, String password) async {
    await _auth
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) => Get.offAll(Dashboard()))
        .catchError((onError) => Get.snackbar(
              "Error while siging in",
              onError.message,
              snackPosition: SnackPosition.BOTTOM,
              duration: Duration(seconds: 7),
              backgroundColor: Colors.red,
              colorText: Colors.white,
            ));
  }

  void signOut() async {
    await _auth.signOut().then((value) => Get.offAll(LoginPage()));
  }

  void sendPasswordResetEmail(String email) async {
    await _auth.sendPasswordResetEmail(email: email).then((value) {
      Get.offAll(LoginPage());
      Get.snackbar("Password reset email link has been sent", "Succsess");
    }).catchError((onError) =>
        Get.snackbar("Error sending Email reset link", onError.message));
  }

  void deleteUserAccount(String email, String password) async {
    User user = _auth.currentUser;

    AuthCredential credential =
        EmailAuthProvider.credential(email: email, password: password);
    await user.reauthenticateWithCredential(credential).then((value) {
      value.user.delete().then((res) {
        Get.offAll(LoginPage());
        Get.snackbar("User Account Deleted", "Success");
      });
    });
  }

  void google_SignIn() async {
    final GoogleSignInAccount googleUser = await googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    final AuthCredential credential = GoogleAuthProvider.credential(
        idToken: googleAuth.idToken, accessToken: googleAuth.accessToken);
  }

  void googleSignOut() async {
    await googleSignIn.signOut().then((value) => Get.offAll(LoginPage()));
  }

  Future<Null> fb_login() async {
    final FacebookLoginResult result = await facebookSignIn.logIn(['email']);

    switch (result.status) {
      case FacebookLoginStatus.loggedIn:
        final FacebookAccessToken accessToken = result.accessToken;
        print(''' Logged in! 
      
      Token: ${accessToken.token}
      User id: ${accessToken.userId}
      Expires: ${accessToken.expires}
      Permissions: ${accessToken.permissions}
      Decline permission: ${accessToken.declinedPermissions}


      ''');
        break;
      case FacebookLoginStatus.cancelledByUser:
        print('Login cancelled by the user.');
        break;
      case FacebookLoginStatus.error:
        print('Something went wrong with the login process. \n'
            'Here\'s the error Facebook gave us: ${result.errorMessage}');
        break;
    }
  }
}
