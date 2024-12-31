import 'package:flutter/material.dart';
import 'package:get/get.dart'; // Add GetX package import
import 'package:liga_inggris_mobile/app/config/app_colors.dart';

class CustomScreenAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  final String? title;

  const CustomScreenAppBar({
    super.key,
    this.title,
  });

  void _handleOnTapBack() {
    Get.back();
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: _handleOnTapBack,
            child: Row(
              children: [
                Icon(
                  Icons.arrow_back_ios,
                  color: AppColors.appBarTitle,
                ),
                const SizedBox(width: 8),
                Text(
                  title ?? "back",
                  style: TextStyle(
                    color: AppColors.appBarTitle,
                    fontSize: 14,
                    fontFamily: "Poppins-ExtraBoldItalic",
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      backgroundColor: AppColors.appBarBackground,
      scrolledUnderElevation: 0.0,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
