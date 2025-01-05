import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:liga_inggris_mobile/presentation/common/club_logo_widget.dart';
import 'package:liga_inggris_mobile/presentation/controllers/search/search_page_controller.dart';
import 'package:liga_inggris_mobile/services/club/model.dart';

class ClubCardWidget extends GetView<SearchPageController> {
  final ClubModel club;

  const ClubCardWidget({super.key, required this.club});

  void _handleTapCard() {
    controller.goToClubDetail(club.id ?? 0);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _handleTapCard,
      child: Container(
        margin: const EdgeInsets.all(8.0),
        child: Card(
          color: Colors.transparent,
          shape: RoundedRectangleBorder(
            side: const BorderSide(color: Colors.white, width: 2.0),
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: SizedBox(
            height: 120,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 12),
                  child: Container(
                    width: 100,
                    alignment: Alignment.center,
                    child: ClubLogoWidget(
                      imageUrl: club.logo ?? '',
                      width: 80,
                      height: 80,
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.only(left: 16.0, right: 32.0),
                  child: Text(
                    club.name ?? 'Unknown Club',
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
