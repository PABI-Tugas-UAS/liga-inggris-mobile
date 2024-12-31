import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:liga_inggris_mobile/app/config/app_colors.dart';
import 'package:liga_inggris_mobile/app/controllers/auth/auth_controller.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
  });

  void _handleOnSelected(String value) {
    if (value == 'logout') {
      Get.find<AuthController>().logout();
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Liga Inggris Mobile',
            style: TextStyle(
              color: AppColors.appBarTitle,
              fontSize: 14,
              fontFamily: "Poppins-ExtraBoldItalic",
            ),
          )
        ],
      ),
      backgroundColor: AppColors.appBarBackground,
      scrolledUnderElevation: 0.0,
      actions: [
        Stack(
          children: [
            PopupMenuButton<String>(
              onSelected: _handleOnSelected,
              itemBuilder: (BuildContext context) => [
                const PopupMenuItem(
                  value: 'logout',
                  child: Text('Logout'),
                ),
              ],
              child: Stack(
                children: [
                  const CircleAvatar(
                    radius: 18,
                    child: Icon(Icons.person, size: 36),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: const CircleAvatar(
                        radius: 6,
                        backgroundColor: Color(0xff0AAD07),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(width: 10)
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
