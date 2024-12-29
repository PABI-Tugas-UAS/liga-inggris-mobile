import 'package:flutter/material.dart';

Widget button({
  required String label,
  required VoidCallback onPressed,
}) {
  return SizedBox(
    width: double.infinity,
    child: ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF3E2F9A).withOpacity(0.45),
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
        style: const TextStyle(fontSize: 16, fontFamily: 'Poppins'),
      ),
    ),
  );
}
