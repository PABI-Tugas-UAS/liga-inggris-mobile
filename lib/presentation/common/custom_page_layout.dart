import 'package:flutter/material.dart';
import 'package:liga_inggris_mobile/presentation/common/custom_app_bar.dart';

class CustomPageLayout extends StatelessWidget {
  final List<Widget> children;
  final String? title;

  const CustomPageLayout({
    super.key,
    required this.children,
    this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      backgroundColor: Colors.transparent,
      body: DefaultTextStyle(
        style: const TextStyle(color: Colors.white),
        child: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16),
          child: Column(
            children: [
              _buildTitle(),
              ...children,
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTitle() {
    if (title == null) {
      return const SizedBox(height: 20);
    }

    return Column(
      children: [
        Text(
          title!,
          style: const TextStyle(fontSize: 24),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
