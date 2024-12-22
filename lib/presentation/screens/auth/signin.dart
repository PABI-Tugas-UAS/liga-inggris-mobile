import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:liga_inggris_mobile/app/config/app_background_color.dart';
import 'package:liga_inggris_mobile/app/controllers/auth/auth_controller.dart';

class SignInScreen extends GetView<AuthController> {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BaseBackground(
        child: Center(
          child: Obx(() {
            if (controller.isLoggedIn.value) {
              print("isLoggedIn.value ---: ${controller.isLoggedIn.value}");
              WidgetsBinding.instance.addPostFrameCallback((_) {
                Get.toNamed('/');
              });
              return const Center(child: Text("Redirecting..."));
            }

            // TODO: handle login input here
            return ElevatedButton(
              onPressed: () {
                controller.isLoggedIn.value = true;
              },
              child: const Text("Login"),
            );
          }),
        ),
      ),
    );
  }
}
