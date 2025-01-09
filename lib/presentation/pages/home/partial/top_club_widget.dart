import 'package:flutter/material.dart';
import 'package:liga_inggris_mobile/presentation/common/club_logo_widget.dart';
import 'package:liga_inggris_mobile/services/club/model.dart';

class TopClubWidget extends StatelessWidget {
  final List<ClubModel> topClubs;

  const TopClubWidget({super.key, required this.topClubs});

  String _getRenkSuffix(int number) {
    switch (number) {
      case 1:
        return 'st';
      case 2:
        return 'nd';
      case 3:
        return 'rd';
      default:
        return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: topClubs.asMap().entries.map(
        (entry) {
          final index = entry.key;
          final club = entry.value;
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                SizedBox(
                  width: 80,
                  child: ClubLogoWidget(
                    imageUrl: club.logo!,
                    width: 80,
                    height: 80,
                  ),
                ),
                Positioned(
                  bottom: -5,
                  child: Text(
                    '${index + 1}${_getRenkSuffix(index + 1)}',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      shadows: [
                        Shadow(
                          offset: Offset(1, 1),
                          blurRadius: 3,
                          color: Colors.black,
                        ),
                        Shadow(
                          offset: Offset(-1, -1),
                          blurRadius: 3,
                          color: Colors.black,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ).toList(),
    );
  }
}
