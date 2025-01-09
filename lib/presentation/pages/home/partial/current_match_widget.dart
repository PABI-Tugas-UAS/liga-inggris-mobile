import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:liga_inggris_mobile/app/config/app_colors.dart';
import 'package:liga_inggris_mobile/presentation/common/club_logo_widget.dart';
import 'package:liga_inggris_mobile/services/match/model.dart';

class CurrentMatchWidget extends StatelessWidget {
  final RxList<MatchModel> currentMatch;
  final VoidCallback onTap;

  const CurrentMatchWidget({
    super.key,
    required this.onTap,
    required this.currentMatch,
  });

  @override
  Widget build(BuildContext context) {
    if (currentMatch.isEmpty) {
      return const Column(
        children: [
          SizedBox(height: 10),
          Text(
            "Pertandingan Saat Ini",
            style: TextStyle(color: Colors.white, fontSize: 24),
          ),
          Center(
            child: Text(
              "Tidak ada pertandingan",
              style: TextStyle(color: Colors.white, fontSize: 16),
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
          style: TextStyle(
              color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
        ),
        Stack(
          children: [
            Center(
              child: SingleChildScrollView(
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
                                style: TextStyle(color: Colors.white),
                              );
                            }
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SizedBox(
                                  width: 100,
                                  height: 130,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
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
                                          color: Colors.white,
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
                                    color: Colors.white,
                                    fontSize: 24,
                                  ),
                                ),
                                Column(
                                  children: [
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
                                              color: Colors.white,
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
                                )
                              ],
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const Positioned(
              top: 23,
              left: 0,
              right: 0,
              child: Center(
                child: Text(
                  'Babak 1',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Poppins-Regular',
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 23,
              left: 0,
              right: 0,
              child: Center(
                child: Column(
                  children: [
                    const Text(
                      "Time Quarter:",
                      style: TextStyle(color: Colors.white, fontSize: 7),
                    ),
                    Text(
                      match.time,
                      style: const TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
