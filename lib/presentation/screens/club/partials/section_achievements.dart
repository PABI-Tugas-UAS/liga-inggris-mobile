import 'package:flutter/material.dart';
import 'package:liga_inggris_mobile/app/config/app_colors.dart';

class SectionAchievements extends StatelessWidget {
  final List<String> achievements;

  const SectionAchievements({super.key, required this.achievements});

  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: AppColors.cardBackground,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            for (final achievement in achievements)
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("•"),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      achievement,
                      style: const TextStyle(fontSize: 12),
                    ),
                  ),
                ],
              )
          ],
        ),
      ),
    );
  }
}
