import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:liga_inggris_mobile/presentation/common/club_logo_widget.dart';
import 'package:liga_inggris_mobile/presentation/common/custom_page_layout.dart';
import 'package:liga_inggris_mobile/presentation/controllers/profile/profile_page_controller.dart';
import 'package:liga_inggris_mobile/presentation/pages/profile/partial/favorite_card_widget.dart';
import 'package:liga_inggris_mobile/presentation/pages/profile/partial/profile_card_widget.dart';

class ProfilePage extends GetView<ProfilePageController> {
  final CupertinoTabController tabController;

  const ProfilePage({super.key, required this.tabController});

  @override
  Widget build(BuildContext context) {
    return CustomPageLayout(
      scrollableChild: true,
      onRefresh: controller.loadProfileData,
      title: "Profile",
      children: [
        Obx(() {
          if (controller.isProfileLoading.value) {
            return const Center(child: CircularProgressIndicator());
          }
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: ProfileCardWidget(
                  photoUrl: controller.photoUrl.value,
                  isEditing: controller.isEditing.value,
                ),
              ),
              const FavoriteCardWidget(),
            ],
          );
        }),
      ],
    );
  }
}
