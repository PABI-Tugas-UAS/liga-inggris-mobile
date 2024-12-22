import 'package:get/get.dart';

class AuthController extends GetxController {
  AuthController();
  var isLoggedIn = true.obs;

  // TODO: pengecekan email & password
  void login() {
    isLoggedIn.value = true;
  }

  void logout() {
    isLoggedIn.value = false;
    Get.toNamed('/signin');
    print("logoutfunc: ${isLoggedIn.value}");
  }
}
