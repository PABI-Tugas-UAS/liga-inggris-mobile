import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:liga_inggris_mobile/app/config/app_background_color.dart';
import 'package:liga_inggris_mobile/app/controllers/auth/auth_controller.dart';
import 'package:liga_inggris_mobile/app/extensions/color.dart';

class SignInScreen extends GetView<AuthController> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final RxBool _obscurePassword = true.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BaseBackground(
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 120, horizontal: 24),
              child: Container(
                constraints: const BoxConstraints(maxWidth: 400),
                decoration: BoxDecoration(
                  color: HexColor("0F1012").withOpacity(0.35),
                  border: Border.all(
                    color: Colors.white,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Center(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(top: 8, bottom: 24),
                        child: Text(
                          'SIGN IN',
                          style: TextStyle(fontSize: 20, fontFamily: 'Poppins'),
                        ),
                      ),
                      TextFormField(
                        controller: _emailController,
                        style: const TextStyle(
                            color: Colors.white, fontFamily: 'Poppins'),
                        decoration: InputDecoration(
                            contentPadding:
                                const EdgeInsets.symmetric(horizontal: 20),
                            labelText: "Email",
                            labelStyle: const TextStyle(
                                color: Colors.grey, fontFamily: 'Poppins'),
                            hintText: "Masukkan email",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: const BorderSide(
                                  color: Colors.grey, width: 2),
                            )),
                      ),
                      const SizedBox(height: 16),
                      Obx(() {
                        return TextFormField(
                          controller: _passwordController,
                          style: const TextStyle(
                              color: Colors.white, fontFamily: 'Poppins'),
                          decoration: InputDecoration(
                            contentPadding:
                                const EdgeInsets.symmetric(horizontal: 20),
                            labelText: "Kata Sandi",
                            labelStyle: const TextStyle(
                                color: Colors.grey, fontFamily: 'Poppins'),
                            hintText: "Masukkan kata sandi",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide: const BorderSide(
                                  color: Colors.grey, width: 2),
                            ),
                            suffixIcon: IconButton(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              onPressed: () {
                                _obscurePassword.value =
                                    !_obscurePassword.value;
                              },
                              icon: Icon(
                                _obscurePassword.value
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                              ),
                            ),
                          ),
                          obscureText: _obscurePassword.value,
                        );
                      }),
                      const SizedBox(height: 16),
                      Obx(() {
                        if (controller.isLoggedIn.value) {
                          print(
                              "isLoggedIn.value ---: ${controller.isLoggedIn.value}");
                          WidgetsBinding.instance.addPostFrameCallback((_) {
                            Get.toNamed('/');
                          });
                          return const Center(child: Text("Redirecting..."));
                        }

                        return SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              final email = _emailController.text;
                              final password = _passwordController.text;
                              Get.find<AuthController>().login(email, password);
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  HexColor("3E2F9A").withOpacity(0.45),
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(24),
                              ),
                              side: const BorderSide(
                                color: Colors.white,
                                width: 0.5,
                              ),
                              padding: const EdgeInsets.symmetric(
                                vertical: 20,
                              ),
                            ),
                            child: const Text(
                              "Login",
                              style: TextStyle(
                                  fontSize: 16, fontFamily: 'Poppins'),
                            ),
                          ),
                        );
                      }),
                      const SizedBox(
                        height: 16,
                      ),
                      const Row(
                        children: [
                          Expanded(
                            child: Divider(
                              thickness: 1,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8.0),
                            child: Text(
                              "or",
                              style: TextStyle(fontFamily: 'Poppins'),
                            ),
                          ),
                          Expanded(
                            child: Divider(
                              thickness: 1,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            Get.toNamed('/register');
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                HexColor("3E2F9A").withOpacity(0.45),
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24),
                            ),
                            side: const BorderSide(
                              color: Colors.white,
                              width: 0.5,
                            ),
                            padding: const EdgeInsets.symmetric(
                              vertical: 20,
                            ),
                          ),
                          child: const Text(
                            "Register",
                            style:
                                TextStyle(fontSize: 16, fontFamily: 'Poppins'),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                    ],
                  )),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
