import 'package:flutter/material.dart';

class NotificationCardWidget extends StatelessWidget {
  final String text;
  const NotificationCardWidget({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.white),
      ),
      child: Text(
        text,
      ),
    );
  }
}
