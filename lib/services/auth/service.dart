import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:liga_inggris_mobile/app/core/base/base_service.dart';
import 'package:liga_inggris_mobile/app/core/handler/service_result.dart';
import 'package:liga_inggris_mobile/services/auth/model.dart';
import 'package:liga_inggris_mobile/services/club/model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService extends BaseService {
  final List<UserModel> userList = [
    UserModel(name: '', email: '@', password: ''),
    UserModel(name: 'Herlin', email: 'herlin@gmail.com', password: 'admin123'),
    UserModel(name: 'Sharon', email: 'sharon@gmail.com', password: 'admin123'),
    UserModel(name: 'Fanes', email: 'fanes@gmail.com', password: 'admin123'),
    UserModel(name: 'Steven', email: 'steven@gmail.com', password: 'admin123'),
  ];

  var isLoggedIn = false.obs;

  Future<void> login(String email, String password) async {
    bool isValidUser = false;

    for (UserModel user in userList) {
      if (user.email == email && user.password == password) {
        isValidUser = true;
        break;
      }
    }

    if (isValidUser) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setBool('isLoggedIn', true);
      await prefs.setString('email', email);
      isLoggedIn.value = true;
      Get.offNamed('/');
    } else {
      Get.snackbar(
        "Login Gagal",
        "Email atau password salah",
        snackPosition: SnackPosition.TOP,
        colorText: Colors.white,
      );
    }
  }

  Future<void> logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    isLoggedIn.value = false;
  }
}
