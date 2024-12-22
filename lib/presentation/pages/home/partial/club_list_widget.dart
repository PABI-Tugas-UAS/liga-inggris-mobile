import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:liga_inggris_mobile/services/club/model.dart';

class ClubListWidget extends StatelessWidget {
  final List<ClubModel> clubs;

  const ClubListWidget({super.key, required this.clubs});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: clubs.map((club) {
          return Container(
            margin: const EdgeInsets.all(8.0),
            child: Card(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SvgPicture.network(
                    club.logo!,
                    width: 100,
                    height: 100,
                    placeholderBuilder: (context) =>
                        const CircularProgressIndicator(),
                  ),
                  Text(club.name ?? 'Unknown Club'),
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
