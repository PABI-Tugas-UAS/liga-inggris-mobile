import 'package:flutter/material.dart';
import 'package:liga_inggris_mobile/presentation/common/club_logo_widget.dart';
import 'package:liga_inggris_mobile/services/club/model.dart';

class TopClubWidget extends StatelessWidget {
  final List<ClubModel> topClubs;

  const TopClubWidget({super.key, required this.topClubs});

  String _getRankSuffix(int number) {
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

  Color _getRankColor(int index) {
    if (index == 0) {
      return Colors.yellowAccent;
    } else if (index == 1) {
      return Colors.grey[200]!;
    } else if (index == 2) {
      return Colors.deepOrange;
    } else {
      return Colors.white;
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
                    '${index + 1}${_getRankSuffix(index + 1)}',
                    style: TextStyle(
                      color: _getRankColor(index),
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      shadows: const [
                        Shadow(
                          offset: Offset(2, 2),
                          blurRadius: 1,
                          color: Colors.black,
                        ),
                        Shadow(
                          offset: Offset(-2, -2),
                          blurRadius: 1,
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
