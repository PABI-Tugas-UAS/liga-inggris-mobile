import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget inputField({
  String? label,
  String? labelText,
  required TextEditingController controller,
  required String hintText,
  String type = 'text',
  RxBool? obscurePassword,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      if (label != null)
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Text(
            label,
            style: const TextStyle(fontFamily: 'Poppins', color: Colors.white),
          ),
        ),
      TextFormField(
        controller: controller,
        style: const TextStyle(color: Colors.white, fontFamily: 'Poppins'),
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(horizontal: 20),
          hintText: hintText,
          hintStyle: const TextStyle(color: Colors.grey),
          labelText: labelText,
          labelStyle:
              const TextStyle(color: Colors.grey, fontFamily: 'Poppins'),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Colors.grey, width: 2),
          ),
          suffixIcon: type == 'password'
              ? IconButton(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  onPressed: () {
                    if (obscurePassword != null) {
                      obscurePassword.value = !obscurePassword.value;
                    }
                  },
                  icon: Icon(
                    obscurePassword?.value ?? false
                        ? Icons.visibility_off
                        : Icons.visibility,
                    color: Colors.grey,
                  ),
                )
              : null,
        ),
        obscureText: obscurePassword?.value ?? false,
      )
    ],
  );
}
