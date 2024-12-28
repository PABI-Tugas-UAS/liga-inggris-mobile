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

  RegisterScreen({super.key});

  void _register() {
    final email = _emailController.text.trim();
    final username = _usernameController.text.trim();
    final password = _passwordController.text;
    final confirmPassword = _confirmPasswordController.text;

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
  }

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
                      child: _RegisterForm(
                          emailController: _emailController,
                          usernameController: _usernameController,
                          passwordController: _passwordController,
                          confirmPasswordController: _confirmPasswordController,
                          onRegister: _register)),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _RegisterForm extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController usernameController;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;
  final VoidCallback onRegister;

  const _RegisterForm({
    required this.emailController,
    required this.usernameController,
    required this.passwordController,
    required this.confirmPasswordController,
    required this.onRegister,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
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
        _buildInputField(
          label: 'Email',
          controller: emailController,
          hintText: "Masukkan email anda",
        ),
        _buildInputField(
          label: 'Nama Pengguna',
          controller: usernameController,
          hintText: "Masukkan nama anda",
        ),
        _buildInputField(
          label: 'Kata Sandi',
          controller: passwordController,
          hintText: "Masukkan kata sandi",
        ),
        _buildInputField(
          label: 'Konfirmasi Kata Sandi',
          controller: confirmPasswordController,
          hintText: "Konfirmasi kata sandi",
        ),
        const SizedBox(height: 20),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: onRegister,
            style: ElevatedButton.styleFrom(
              backgroundColor: HexColor("3E2F9A").withOpacity(0.45),
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
        const SizedBox(height: 28),
      ],
    );
  }

  Widget _buildInputField({
    required String label,
    required TextEditingController controller,
    required String hintText,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(5),
          child: Text(
            label,
            style: const TextStyle(fontFamily: 'Poppins'),
          ),
        ),
        TextFormField(
          controller: controller,
          style: const TextStyle(color: Colors.white, fontFamily: 'Poppins'),
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(horizontal: 20),
            labelStyle:
                const TextStyle(color: Colors.grey, fontFamily: 'Poppins'),
            hintText: hintText,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Colors.grey, width: 2),
            ),
          ),
        ),
        const SizedBox(height: 8),
      ],
    );
  }
}
