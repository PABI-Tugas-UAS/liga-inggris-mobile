import 'package:flutter/material.dart';

class InputField extends StatefulWidget {
  final String? label;
  final String? labelText;
  final TextEditingController controller;
  final String hintText;
  final String type;

  const InputField({
    this.label,
    this.labelText,
    required this.controller,
    required this.hintText,
    this.type = 'text',
    super.key,
  });

  @override
  _InputFieldState createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  bool obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    Widget? suffixIcon = widget.type == 'password'
        ? IconButton(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            onPressed: () {
              setState(() {
                obscurePassword = !obscurePassword;
              });
            },
            icon: Icon(
              obscurePassword ? Icons.visibility_off : Icons.visibility,
              color: Colors.grey,
            ),
          )
        : null;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.label != null)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Text(
              widget.label!,
              style:
                  const TextStyle(fontFamily: 'Poppins', color: Colors.white),
            ),
          ),
        TextFormField(
          controller: widget.controller,
          style: const TextStyle(color: Colors.white, fontFamily: 'Poppins'),
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(horizontal: 20),
            hintText: widget.hintText,
            hintStyle: const TextStyle(color: Colors.grey),
            labelText: widget.labelText,
            labelStyle:
                const TextStyle(color: Colors.grey, fontFamily: 'Poppins'),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Colors.grey, width: 2),
            ),
            suffixIcon: suffixIcon,
          ),
          obscureText: widget.type == 'password' && obscurePassword,
        ),
      ],
    );
  }
}