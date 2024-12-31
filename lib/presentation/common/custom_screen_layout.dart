import 'package:flutter/material.dart';
import 'package:liga_inggris_mobile/app/config/app_background_color.dart';
import 'package:liga_inggris_mobile/presentation/common/custom_screen_app_bar.dart';

class CustomScreenLayout extends StatelessWidget {
  final List<Widget> children;
  final String? goBackTitle;
  final String? title;

  const CustomScreenLayout({
    super.key,
    required this.children,
    this.goBackTitle,
    this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomScreenAppBar(title: goBackTitle),
      backgroundColor: Colors.transparent,
      resizeToAvoidBottomInset: true,
      body: BaseBackground(
        child: DefaultTextStyle(
          style: const TextStyle(color: Colors.white),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                        minHeight: MediaQuery.of(context).size.height,
                        minWidth: MediaQuery.of(context).size.width,
                      ),
                      child: IntrinsicHeight(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            _buildTitle(),
                            ...children,
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
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
