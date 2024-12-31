import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:liga_inggris_mobile/app/config/app_background_color.dart';
import 'package:liga_inggris_mobile/app/config/app_colors.dart';
import 'package:liga_inggris_mobile/presentation/common/button_widget.dart';
import 'package:liga_inggris_mobile/presentation/common/input_field_widget.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  void _handleRegister() {
    final email = _emailController.text.trim();
    final username = _usernameController.text.trim();
    final password = _passwordController.text;
    final confirmPassword = _confirmPasswordController.text;

    if ([email, username, password, confirmPassword]
        .any((item) => item.isEmpty)) {
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
  }

  void _handleBack() {
    Get.toNamed('/signin');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: BaseBackground(
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 24),
              child: Stack(
                children: [
                  Container(
                    constraints: const BoxConstraints(maxWidth: 400),
                    decoration: BoxDecoration(
                      color: AppColors.cardBackground,
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
                                style: TextStyle(
                                    fontSize: 20,
                                    fontFamily: 'Poppins-Regular'),
                              ),
                            ),
                            _RegisterForm(
                                emailController: _emailController,
                                usernameController: _usernameController,
                                passwordController: _passwordController,
                                confirmPasswordController:
                                    _confirmPasswordController),
                            const SizedBox(height: 20),
                            button(label: "Daftar", onPressed: _handleRegister),
                            const SizedBox(height: 28),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(4),
                    child: IconButton(
                      onPressed: _handleBack,
                      icon: const Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _RegisterForm extends StatelessWidget {
  const _RegisterForm({
    required this.emailController,
    required this.usernameController,
    required this.passwordController,
    required this.confirmPasswordController,
  });

  final TextEditingController emailController;
  final TextEditingController usernameController;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        InputField(
          label: 'Email',
          controller: emailController,
          hintText: "Masukkan email anda",
        ),
        const SizedBox(height: 8),
        InputField(
          label: 'Nama Pengguna',
          controller: usernameController,
          hintText: "Masukkan nama anda",
        ),
        const SizedBox(height: 8),
        InputField(
          label: 'Kata Sandi',
          controller: passwordController,
          hintText: "Masukkan kata sandi",
          type: 'password',
        ),
        const SizedBox(height: 8),
        InputField(
          label: 'Konfirmasi Kata Sandi',
          controller: confirmPasswordController,
          hintText: "Konfirmasi kata sandi",
          type: 'password',
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}
