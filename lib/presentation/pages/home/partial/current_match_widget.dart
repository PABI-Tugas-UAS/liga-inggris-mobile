import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:liga_inggris_mobile/app/config/app_colors.dart';
import 'package:liga_inggris_mobile/presentation/common/clickable_card_widget.dart';
import 'package:liga_inggris_mobile/presentation/common/club_logo_widget.dart';
import 'package:liga_inggris_mobile/presentation/controllers/home/home_controller.dart';
import 'package:liga_inggris_mobile/services/match/model.dart';

class CurrentMatchWidget extends GetView<HomeController> {
  final RxList<MatchModel> currentMatch;

  const CurrentMatchWidget({
    super.key,
    required this.currentMatch,
  });

  void _handleTapCard(int matchId) {
    controller.goToMatchDetail(matchId);
  }

  @override
  Widget build(BuildContext context) {
    if (currentMatch.isEmpty) {
      return const Column(
        children: [
          SizedBox(height: 10),
          Text(
            "Pertandingan Saat Ini",
            style: TextStyle(fontSize: 24),
          ),
          Center(
            child: Text(
              "Tidak ada pertandingan",
              style: TextStyle(fontSize: 16),
            ),
          ),
        ],
      );
    }
    final match = currentMatch.first;
    return Column(
      children: [
        const Text(
          "Pertandingan Saat Ini",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        ClickableCard(
          onTap: () => _handleTapCard(match.id),
          color: AppColors.cardBackground,
          child: DefaultTextStyle(
            style: TextStyle(color: AppColors.text),
            child: Stack(
              children: [
                Center(
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 24),
                    child: Container(
                      constraints: const BoxConstraints(maxWidth: 600),
                      decoration: BoxDecoration(
                        color: AppColors.cardBackground,
                        border: Border.all(
                          color: Colors.white,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 8),
                        child: Center(
                          child: Obx(
                            () {
                              if (currentMatch.isEmpty) {
                                return const Text(
                                  "Tidak ada pertandingan",
                                );
                              }
                              return Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  SizedBox(
                                    width: 100,
                                    height: 130,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        ClubLogoWidget(
                                          imageUrl: match.homeClub.logo!,
                                          width: 80,
                                          height: 80,
                                        ),
                                        const SizedBox(height: 6),
                                        Text(
                                          match.homeClub.name!,
                                          textAlign: TextAlign.center,
                                          style: const TextStyle(
                                            fontSize: 14,
                                          ),
                                          // softWrap: true,
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 1,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Text(
                                    ' ${match.homeScore}  -  ${match.awayScore} ',
                                    style: const TextStyle(
                                      fontSize: 24,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 100,
                                    height: 125,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        ClubLogoWidget(
                                          imageUrl: match.awayClub.logo!,
                                          width: 80,
                                          height: 80,
                                        ),
                                        const SizedBox(height: 6),
                                        Text(
                                          match.awayClub.name!,
                                          textAlign: TextAlign.center,
                                          style: const TextStyle(
                                            fontSize: 14,
                                          ),
                                          // softWrap: true,
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 1,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 18,
                  left: 0,
                  right: 0,
                  child: Center(
                    child: Text(
                      match.location,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 18,
                  left: 0,
                  right: 0,
                  child: Center(
                    child: Column(
                      children: [
                        const Text(
                          "Start time:",
                          style: TextStyle(fontSize: 9),
                        ),
                        Text(
                          match.time,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
