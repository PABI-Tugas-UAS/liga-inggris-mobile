import 'package:get/get.dart';
import 'package:liga_inggris_mobile/services/auth/service.dart';

class AuthController extends GetxController {
  AuthController();
  var isLoggedIn = false.obs;
  final AuthService _authService = AuthService();

  // TODO: pengecekan email & password
  void login(String email, String password) async {
    isLoggedIn.value = true;
    if (isLoggedIn.value) {
      Get.toNamed('/');
    }
    await _authService.login(email, password);
    isLoggedIn.value = _authService.isLoggedIn.value;
  }

  void logout() async {
    await _authService.logout();
    isLoggedIn.value = false;
    Get.toNamed('/signin');
    print("logoutfunc: ${isLoggedIn.value}");
  }
}
