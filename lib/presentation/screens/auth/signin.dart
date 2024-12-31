import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:liga_inggris_mobile/app/config/app_background_color.dart';
import 'package:liga_inggris_mobile/app/config/app_colors.dart';
import 'package:liga_inggris_mobile/app/controllers/auth/auth_controller.dart';
import 'package:liga_inggris_mobile/presentation/common/button_widget.dart';
import 'package:liga_inggris_mobile/presentation/common/input_field_widget.dart';

class SignInScreen extends GetView<AuthController> {
  SignInScreen({super.key});

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _handleLogin() {
    final email = _emailController.text;
    final password = _passwordController.text;
    Get.find<AuthController>().login(email, password);
  }

  void _handleRegister() {
    Get.toNamed('/register');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: BaseBackground(
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 120, horizontal: 24),
              child: Container(
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
                          padding: EdgeInsets.only(top: 8, bottom: 24),
                          child: Text(
                            'SIGN IN',
                            style:
                                TextStyle(fontSize: 20, fontFamily: 'Poppins'),
                          ),
                        ),
                        _SignInForm(
                          emailController: _emailController,
                          passwordController: _passwordController,
                        ),
                        const SizedBox(height: 16),
                        button(label: "Login", onPressed: _handleLogin),
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
                        button(label: 'Register', onPressed: _handleRegister),
                        const SizedBox(
                          height: 24,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _SignInForm extends StatelessWidget {
  const _SignInForm({
    required this.emailController,
    required this.passwordController,
  });

  final TextEditingController emailController;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InputField(
          labelText: 'Email',
          controller: emailController,
          hintText: 'Masukkan email anda',
        ),
        const SizedBox(height: 16),
        InputField(
          labelText: 'Kata Sandi',
          controller: passwordController,
          hintText: 'Masukkan kata sandi',
          type: 'password',
        ),
      ],
    );
  }
}
