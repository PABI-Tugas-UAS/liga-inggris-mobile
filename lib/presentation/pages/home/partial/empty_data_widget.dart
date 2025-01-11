import 'package:flutter/material.dart';

class EmptyDataWidget extends StatelessWidget {
  final String title;
  final String message;

  const EmptyDataWidget({
    super.key,
    required this.title,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 10),
        Text(
          title,
          style: const TextStyle(fontSize: 24),
        ),
        Center(
          child: Text(
            message,
            style: const TextStyle(fontSize: 16),
          ),
        ),
      ],
    );
  }
}
