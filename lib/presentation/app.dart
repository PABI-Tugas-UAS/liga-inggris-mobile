import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:liga_inggris_mobile/presentation/initial_binding.dart';
import 'package:liga_inggris_mobile/presentation/pages/layout.dart';
import 'package:liga_inggris_mobile/presentation/screens/auth/register.dart';
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
          page: () => const LayoutPage(),
        ),

        // screens without bottom nav
        GetPage(
          name: '/signin',
          page: () => SignInScreen(),
        ),

        GetPage(
          name: '/register',
          page: () => RegisterScreen(),
        ),
      ],
      localizationsDelegates: const [
        DefaultCupertinoLocalizations.delegate,
        DefaultMaterialLocalizations.delegate,
        DefaultWidgetsLocalizations.delegate,
      ],
    );
  }
}
