import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:liga_inggris_mobile/presentation/initial_binding.dart';
import 'package:liga_inggris_mobile/presentation/pages/layout.dart';
import 'package:liga_inggris_mobile/presentation/screens/auth/register_screen.dart';
import 'package:liga_inggris_mobile/presentation/screens/auth/signin_screen.dart';
import 'package:liga_inggris_mobile/presentation/screens/match/match_detail_screen.dart';

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
        GetPage(
          name: '/match/:matchId',
          page: () => MatchDetailScreen(
            matchId: Get.parameters['matchId']!,
          ),
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
