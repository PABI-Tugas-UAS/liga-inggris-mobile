import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:liga_inggris_mobile/presentation/initial_binding.dart';
import 'package:liga_inggris_mobile/presentation/pages/base/base_page.dart';
import 'package:liga_inggris_mobile/presentation/screens/auth/signin.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetCupertinoApp(
      initialRoute: '/signin',
      initialBinding: InitialBindings(),
      getPages: [
        // page with bottom nav
        GetPage(
          name: '/',
          page: () => const BasePage(),
        ),

        // screens without bottom nav
        GetPage(
          name: '/signin',
          page: () => const SignInScreen(),
        ),
      ],
    );
  }
}
