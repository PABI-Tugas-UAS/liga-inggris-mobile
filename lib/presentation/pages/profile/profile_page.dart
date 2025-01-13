import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:liga_inggris_mobile/presentation/common/custom_page_layout.dart';
import 'package:liga_inggris_mobile/presentation/controllers/profile/profile_page_controller.dart';
import 'package:liga_inggris_mobile/presentation/pages/profile/partial/favorite_card_widget.dart';
import 'package:liga_inggris_mobile/presentation/pages/profile/partial/profile_card_widget.dart';
import 'package:liga_inggris_mobile/services/club/model.dart';

class ProfilePage extends GetView<ProfilePageController> {
  final CupertinoTabController tabController;

  const ProfilePage({super.key, required this.tabController});

  @override
  Widget build(BuildContext context) {
    final List<ClubModel> favoriteClubs = [
      ClubModel(
        id: 1,
        name: "Arsenal",
        coach: "Ole Gunnar Solskjaer",
        foundedYear: 1878,
        achievements: [
          "Premier League",
          "FA Cup",
          "UEFA Champions League",
        ],
        logo: "https://upload.wikimedia.org/wikipedia/en/5/53/Arsenal_FC.svg",
      ),
      ClubModel(
        id: 2,
        name: "Chelsea",
        coach: "Thomas Tuchel",
        foundedYear: 1905,
        achievements: [
          "Premier League",
          "FA Cup",
          "UEFA Champions League",
        ],
        logo: "https://upload.wikimedia.org/wikipedia/id/c/cc/Chelsea_FC.svg",
      ),
      ];
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
              ...favoriteClubs.map((club) {
                return FavoriteCardWidget(club: club);
              }).toList(),
            ],
          );
        }),
      ],
    );
  }
}
