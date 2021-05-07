import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:getx_firebase_santos/GetXHelper/bindings/auth_bindings.dart';
import 'package:getx_firebase_santos/WelcomePage.dart';
//import 'package:getx_firebase_santos/isSignedIn.dart';
import 'package:get/get.dart';
//import 'package:provider/provider.dart';
import 'package:getx_firebase_santos/Screens/Dashboard.dart';
import 'Screens/LoginPage.dart';
import 'Screens/RegistrationPage.dart';
//import 'InstanceBinding.dart';
//import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: 'Firebase Demo',
        initialBinding: AuthBindings(),
        theme: ThemeData(
            primarySwatch: Colors.blue, accentColor: Colors.blue[400]),
        home: LoginPage(),
        routes: {
          '/welcome': (context) => WelcomePage(),
          '/login': (context) => LoginPage(),
          '/reg': (context) => RegistrationPage(),
          '/dashboard': (context) => Dashboard(),
        });
  }
}

class Splash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: CircularProgressIndicator()),
    );
  }
}
