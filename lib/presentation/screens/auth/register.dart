import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:liga_inggris_mobile/app/config/app_background_color.dart';
import 'package:liga_inggris_mobile/app/extensions/color.dart';

class RegisterScreen extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BaseBackground(
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 24),
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
                        padding: EdgeInsets.only(top: 16, bottom: 20),
                        child: Text(
                          'SIGN UP',
                          style: TextStyle(fontSize: 20, fontFamily: 'Poppins'),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(5),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text('Email',
                              style: TextStyle(fontFamily: 'Poppins')),
                        ),
                      ),
                      TextFormField(
                        controller: _emailController,
                        style: const TextStyle(
                            color: Colors.white, fontFamily: 'Poppins'),
                        decoration: InputDecoration(
                            contentPadding:
                                const EdgeInsets.symmetric(horizontal: 20),
                            labelStyle: const TextStyle(
                                color: Colors.grey, fontFamily: 'Poppins'),
                            hintText: "Masukkan email anda",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: const BorderSide(
                                  color: Colors.grey, width: 2),
                            )),
                      ),
                      const SizedBox(height: 8),
                      const Padding(
                        padding: EdgeInsets.all(5),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text('Nama Pengguna',
                              style: TextStyle(fontFamily: 'Poppins')),
                        ),
                      ),
                      TextFormField(
                        controller: _usernameController,
                        style: const TextStyle(
                            color: Colors.white, fontFamily: 'Poppins'),
                        decoration: InputDecoration(
                            contentPadding:
                                const EdgeInsets.symmetric(horizontal: 20),
                            labelStyle: const TextStyle(
                                color: Colors.grey, fontFamily: 'Poppins'),
                            hintText: "Masukkan nama anda",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: const BorderSide(
                                  color: Colors.grey, width: 2),
                            )),
                      ),
                      const SizedBox(height: 8),
                      const Padding(
                        padding: EdgeInsets.all(5),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text('Kata Sandi',
                              style: TextStyle(fontFamily: 'Poppins')),
                        ),
                      ),
                      TextFormField(
                        controller: _passwordController,
                        style: const TextStyle(
                            color: Colors.white, fontFamily: 'Poppins'),
                        decoration: InputDecoration(
                            contentPadding:
                                const EdgeInsets.symmetric(horizontal: 20),
                            labelStyle: const TextStyle(
                                color: Colors.grey, fontFamily: 'Poppins'),
                            hintText: "Masukkan kata sandi",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: const BorderSide(
                                  color: Colors.grey, width: 2),
                            )),
                      ),
                      const SizedBox(height: 8),
                      const Padding(
                        padding: EdgeInsets.all(5),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Konfirmasi Kata Sandi',
                            style: TextStyle(fontFamily: 'Poppins'),
                          ),
                        ),
                      ),
                      TextFormField(
                        controller: _confirmPasswordController,
                        style: const TextStyle(
                            color: Colors.white, fontFamily: 'Poppins'),
                        decoration: InputDecoration(
                            contentPadding:
                                const EdgeInsets.symmetric(horizontal: 20),
                            labelStyle: const TextStyle(
                                color: Colors.grey, fontFamily: 'Poppins'),
                            hintText: "Konfirmasi kata sandi",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: const BorderSide(
                                  color: Colors.grey, width: 2),
                            )),
                      ),
                      const SizedBox(height: 20),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            final email = _emailController.text.trim();
                            final username = _usernameController.text.trim();
                            final password = _passwordController.text;
                            final confirmPassword =
                                _confirmPasswordController.text;

                            if (email.isEmpty ||
                                username.isEmpty ||
                                password.isEmpty ||
                                confirmPassword.isEmpty) {
                              Get.snackbar(
                                "Registrasi Gagal",
                                "Semua data harus diisi",
                                snackPosition: SnackPosition.TOP,
                                colorText: Colors.white,
                              );
                              return;
                            }

                            if (password != confirmPassword) {
                              Get.snackbar(
                                "Registrasi Gagal",
                                "Kata sandi tidak valid",
                                snackPosition: SnackPosition.TOP,
                                colorText: Colors.white,
                              );
                              return;
                            }

                            Get.snackbar(
                              "Registrasi Berhasil",
                              "Akun berhasil didaftarkan",
                              snackPosition: SnackPosition.TOP,
                              colorText: Colors.white,
                            );

                            Get.toNamed('/signin');
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
                            "Daftar",
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 28,
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
