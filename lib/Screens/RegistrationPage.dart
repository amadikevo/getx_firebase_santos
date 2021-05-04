// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:getx_firebase_santos/GetXHelper/FirebaseController.dart';
import 'package:getx_firebase_santos/Widgets/SocialSignWidgetRow.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:get/get.dart';

import 'LoginPage.dart';

class RegistrationPage extends GetWidget<FirebaseController> {
  final TextEditingController firstName = TextEditingController();
  final TextEditingController lastName = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('App Bar'),
          backgroundColor: Theme.of(context).accentColor),
      body: SafeArea(
        child: Stack(children: [
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("images/assets/backgroundUI.png"),
                    fit: BoxFit.cover)),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(20, 40, 20, 0),
            child: SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 100,
                      width: 100,
                      child: SvgPicture.asset("images/assets/xing.svg"),
                    ),
                    HeightBox(10.0),
                    "Registration".text.color(Colors.white).size(30.0).make(),
                    HeightBox(20.0),
                    Padding(
                      padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
                      child: TextField(
                        controller: firstName,
                        decoration: InputDecoration(
                          hintText: 'First Name',
                          hintStyle: TextStyle(color: Colors.white),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: BorderSide(
                                  color: Theme.of(context).accentColor)),
                          isDense: true,
                          contentPadding: EdgeInsets.fromLTRB(30, 0, 30, 0),
                        ),
                        cursorColor: Colors.white,
                        style: TextStyle(color: Colors.white, fontSize: 25.0),
                      ),
                    ),
                    HeightBox(20.0),
                    Padding(
                      padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
                      child: TextField(
                        controller: lastName,
                        decoration: InputDecoration(
                          hintText: 'Last Name',
                          hintStyle: TextStyle(color: Colors.white),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: BorderSide(
                                  color: Theme.of(context).accentColor)),
                          isDense: true,
                          contentPadding: EdgeInsets.fromLTRB(30, 0, 30, 0),
                        ),
                        cursorColor: Colors.white,
                        style: TextStyle(color: Colors.white, fontSize: 25.0),
                      ),
                    ),
                    HeightBox(20.0),
                    Padding(
                      padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
                      child: TextField(
                        controller: email,
                        decoration: InputDecoration(
                          hintText: 'Email',
                          hintStyle: TextStyle(color: Colors.white),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: BorderSide(
                                  color: Theme.of(context).accentColor)),
                          isDense: true,
                          contentPadding: EdgeInsets.fromLTRB(30, 0, 30, 0),
                        ),
                        cursorColor: Colors.white,
                        style: TextStyle(color: Colors.white, fontSize: 25.0),
                      ),
                    ),
                    HeightBox(20.0),
                    Padding(
                      padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
                      child: TextField(
                        controller: password,
                        decoration: InputDecoration(
                          hintText: 'Password',
                          hintStyle: TextStyle(color: Colors.white),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: BorderSide(
                                  color: Theme.of(context).accentColor)),
                          isDense: true,
                          contentPadding: EdgeInsets.fromLTRB(30, 0, 30, 0),
                        ),
                        cursorColor: Colors.white,
                        style: TextStyle(color: Colors.white, fontSize: 25.0),
                      ),
                    ),
                    HeightBox(20.0),
                    GestureDetector(
                      onTap: () {
                        final close = context.showLoading(msg: "Loading");
                        Future.delayed(4.seconds);
                        registerUser();
                      },
                      child: "Sign-up"
                          .text
                          .white
                          .light
                          .xl
                          .makeCentered()
                          .box
                          .white
                          .shadowOutline(outlineColor: Colors.red[400])
                          .color(Color(0XFFF0772))
                          .roundedLg
                          .make()
                          .w(150)
                          .h(40),
                    ),
                    HeightBox(170),
                    "Login with".text.red800.makeCentered(),
                    SocialSigninWidgetRow()
                  ]),
            ),
          ),
        ]),
      ),
      bottomNavigationBar: GestureDetector(
          onTap: () {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => LoginPage()));
          },
          child: RichText(
              text: TextSpan(
            text: 'New User? ',
            style: TextStyle(fontSize: 15.0, color: Colors.black),
            children: <TextSpan>[
              TextSpan(
                text: 'Login Now',
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                    color: Color(0XFF4321F5)),
              )
            ],
          )).pLTRB(20, 0, 0, 15)),
    );
  }

  void registerUser() {
    controller.createUser(
        firstName.text, lastName.text, email.text, password.text);
  }
}
