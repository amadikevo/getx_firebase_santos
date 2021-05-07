import 'package:get/get.dart';
import 'package:getx_firebase_santos/GetXHelper/FirebaseController.dart';

class AuthBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FirebaseController>(() => FirebaseController());
  }
}
