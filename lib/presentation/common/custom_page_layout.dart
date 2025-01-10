import 'package:flutter/material.dart';
import 'package:liga_inggris_mobile/presentation/common/custom_page_app_bar.dart';

class CustomPageLayout extends StatelessWidget {
  final List<Widget> children;
  final String? title;
  final bool scrollableChild;
  final Function? onRefresh;

  const CustomPageLayout({
    super.key,
    required this.children,
    this.title,
    this.scrollableChild = false,
    this.onRefresh,
  });

  @override
  Widget build(BuildContext context) {
    Widget content = Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _buildTitle(),
        ...children,
      ],
    );

    if (scrollableChild) {
      content = SingleChildScrollView(
        child: content,
      );
    }

    if (onRefresh != null) {
      content = RefreshIndicator(
        onRefresh: () async {
          onRefresh!();
        },
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: content,
        ),
      );
    }

    return Scaffold(
      appBar: const CustomPageAppBar(),
      backgroundColor: Colors.transparent,
      resizeToAvoidBottomInset: true,
      body: DefaultTextStyle(
        style: const TextStyle(
          color: Colors.white,
          fontFamily: 'Poppins-Regular',
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16),
          child: content,
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
