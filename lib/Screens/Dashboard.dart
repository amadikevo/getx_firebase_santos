import 'package:flutter/material.dart';
import 'package:getx_firebase_santos/GetXHelper/FirebaseController.dart';

import 'package:get/get.dart';
import 'DeleteAccount.dart';

class Dashboard extends GetWidget<FirebaseController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(controller.imageUrl),
            ElevatedButton(
              onPressed: () {
                controller.signOut();
              },
              child: Text("Sign Out ${controller.user}"),
            ),
            ElevatedButton(
              onPressed: () {
                Get.to(DeleteAccount());
              },
              child: Text("Delete Account"),
            ),
            ElevatedButton(
              onPressed: () {
                controller.googleSignOut();
              },
              child: Text("Sign out Google Sign in"),
            ),
          ],
        ),
      ),
    );
  }
}
