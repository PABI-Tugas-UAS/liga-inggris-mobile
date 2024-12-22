import 'package:flutter/material.dart';
import 'package:liga_inggris_mobile/app/config/app_colors.dart';
import 'package:liga_inggris_mobile/app/extensions/color.dart';

class BaseBackground extends StatelessWidget {
  final Widget child;

  const BaseBackground({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            HexColor("07050D"),
            HexColor("120E1E"),
            HexColor("19134C"),
            HexColor("170035"),
          ],
          stops: const [0.0, 0.28, 0.6, 0.81],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: DefaultTextStyle(
        style: TextStyle(
          color: AppColors.text,
        ),
        child: child,
      ),
    );
  }
}
