import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:liga_inggris_mobile/presentation/common/custom_screen_layout.dart';
import 'package:liga_inggris_mobile/presentation/controllers/profile/profile_page_controller.dart';
import 'package:liga_inggris_mobile/presentation/screens/favorite/partial/favorite_card_widget.dart';

class FavoriteScreen extends GetView<ProfilePageController> {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final favoriteClubs = controller.favoriteClubs;

    return CustomScreenLayout(
      goBackTitle: "Favorit Klub",
      children: [
        Obx(() {
          if (favoriteClubs.isEmpty) {
            return const Center(
              child: Text("Belum ada klub favorit"),
            );
          }

          return Column(
            children: [
              ...favoriteClubs.map((club) {
                return FavoriteCardWidget(club: club);
              }),
            ],
          );
        })
      ],
    );
  }
}
