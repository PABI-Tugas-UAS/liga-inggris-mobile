import 'package:flutter/material.dart';
import 'package:liga_inggris_mobile/app/config/app_colors.dart';

Widget button({
  required String label,
  required VoidCallback onPressed,
}) {
  return SizedBox(
    width: double.infinity,
    child: ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.buttonBackground,
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
      child: Text(
        label,
        style: const TextStyle(fontSize: 16, fontFamily: 'Poppins-Regular'),
      ),
    ),
  );
}
