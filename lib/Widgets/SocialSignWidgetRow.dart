import 'package:flutter/material.dart';
import 'package:getx_firebase_santos/GetXHelper/FirebaseController.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class SocialSigninWidgetRow extends GetWidget<FirebaseController> {
  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
      GestureDetector(
        onTap: () {
          print("Google Clicked");
          controller.googlesignIn();
        },
        child: Container(
          width: 30,
          height: 30,
          child: SvgPicture.asset("images/assets/google.svg"),
        ),
      ),
      GestureDetector(
          onTap: () {
            print("Facebook Clicked");

            controller.fb_login();
          },
          child: Container(
              width: 30,
              height: 30,
              child: SvgPicture.asset("images/assets/facebook.svg"))),
    ]);
  }
}
