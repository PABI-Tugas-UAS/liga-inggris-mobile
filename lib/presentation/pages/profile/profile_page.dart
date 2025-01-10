import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:liga_inggris_mobile/presentation/common/custom_page_layout.dart';
import 'package:liga_inggris_mobile/presentation/pages/profile/partial/profile_card_widget.dart';
import 'package:liga_inggris_mobile/presentation/controllers/profile/profile_controller.dart';

class ProfilePage extends GetView<ProfileController> {
  final CupertinoTabController tabController;

  const ProfilePage({super.key, required this.tabController});

  @override
  Widget build(BuildContext context) {
    return CustomPageLayout(
      title: "Profile",
      children: [
        Obx(() {
          if (controller.isProfileLoading.value) {
            return const Center(child: CircularProgressIndicator());
          }
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: ProfileCardWidget(
                photoUrl: controller.photoUrl.value,
                namaPengguna: controller.namaPengguna.value,
                isEditing: controller.isEditing.value,
                handleController: controller.handleController,
                bioController: controller.bioController,
                namaPenggunaController: controller.namaPenggunaController,
                onTapEdit: controller.toggleEditMode,
                onTapSimpan: controller.saveProfile,
                onTapLogout: controller.logout,
              ),
            ),
          );
        }),
      ],
    );
  }
}
