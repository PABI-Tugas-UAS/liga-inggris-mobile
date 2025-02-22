import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:liga_inggris_mobile/services/auth/service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController extends GetxController {
  AuthController();
  var isLoggedIn = false.obs;
  final AuthService _authService = AuthService();
  var isDebug = false;

  @override
  void onInit() async {
    super.onInit();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    isLoggedIn.value = prefs.getBool('isLoggedIn') ?? false;

    if (isDebug) {
      await prefs.setBool('isLoggedIn', true);
      await prefs.setString('email', 'akundebug@gmail.com');
      await prefs.setString('user',
          '{"email": "akundebug@gmail.com", "name": "debug mode", "password": "***********"}');
      return Get.offNamed('/');
    }

    if (isLoggedIn.value) {
      Get.offNamed('/');
    } else {
      Get.offNamed('/signin');
    }

    Get.delete();
  }

  Future<void> login(String email, String password) async {
    bool isValidUser = await _authService.login(email, password);

    if (isValidUser) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setBool('isLoggedIn', true);
      await prefs.setString('email', email);
      await prefs.setString('user',
          '{"email": "$email", "name": "${email.split('@')[0]}", "password": "$password"}');
      isLoggedIn.value = true;
      Get.toNamed('/');
      Get.delete();
    } else {
      Get.snackbar(
        "Login Gagal",
        "Email atau password salah",
        snackPosition: SnackPosition.TOP,
        colorText: Colors.white,
      );
    }
  }

  void logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    isLoggedIn.value = false;
    Get.toNamed('/signin');
    Get.delete();
  }
}
