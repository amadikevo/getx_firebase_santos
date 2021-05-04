import 'package:get/get.dart';
import 'package:flutter/material.dart';

import 'GetXHelper/FirebaseController.dart';
import 'Screens/Dashboard.dart';
import 'Screens/LoginPage.dart';

class IsSignedIn extends GetWidget<FirebaseController> {
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Get.find<FirebaseController>().user != null
          ? Dashboard()
          : LoginPage();
    });
  }
}
