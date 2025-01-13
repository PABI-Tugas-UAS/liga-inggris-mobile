import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:liga_inggris_mobile/presentation/common/custom_screen_layout.dart';
import 'package:liga_inggris_mobile/presentation/controllers/profile/profile_page_controller.dart';
import 'package:liga_inggris_mobile/presentation/screens/favorite/partial/favorite_card_widget.dart';

class FavoriteScreen extends GetView<ProfilePageController> {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScreenLayout(
      goBackTitle: "Favorit Klub",
      children: [
        Obx(() {
          return Column(
            children: [
              ...controller.favoriteClubs.map((club) {
                return FavoriteCardWidget(club: club);
              }).toList(),
            ],
          );
        })
      ],
    );
  }
}
