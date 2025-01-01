import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:liga_inggris_mobile/app/config/app_colors.dart';
import 'package:liga_inggris_mobile/app/utils/date_convert.dart';
import 'package:liga_inggris_mobile/app/utils/time_convert.dart';
import 'package:liga_inggris_mobile/presentation/common/clickable_card_widget.dart';
import 'package:liga_inggris_mobile/presentation/common/club_logo_widget.dart';
import 'package:liga_inggris_mobile/presentation/controllers/match/match_page_controller.dart';
import 'package:liga_inggris_mobile/services/match/model.dart';

class MatchCardWidget extends GetView<MatchPageController> {
  final MatchModel match;

  const MatchCardWidget({super.key, required this.match});

  void _handleTapCard() {
    controller.goToMatchDetail(match.id);
  }

  @override
  Widget build(BuildContext context) {
    return ClickableCard(
      onTap: _handleTapCard,
      color: AppColors.cardBackground,
      shape: RoundedRectangleBorder(
        side: BorderSide(color: AppColors.cardBorder),
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: DefaultTextStyle(
        style: TextStyle(color: AppColors.text),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // tanggal pertandingan
              Text(
                convertDate(match.date),
                style: const TextStyle(fontSize: 16.0),
              ),

              const SizedBox(height: 8.0),

              // club yang bertanding
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 8,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ClubLogoWidget(
                          imageUrl: match.homeClub.logo!,
                          width: 50,
                          height: 50,
                        ),
                        const SizedBox(width: 5),
                        Flexible(
                          child: Wrap(
                            alignment: WrapAlignment.end,
                            children: [
                              Text(
                                match.homeClub.name ?? "???",
                                textAlign: TextAlign.right,
                                style: const TextStyle(fontSize: 14.0),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  const Text(
                    "-",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                    ),
                  ),
                  const Spacer(),
                  Expanded(
                    flex: 8,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Wrap(
                            alignment: WrapAlignment.start,
                            children: [
                              Text(
                                match.awayClub.name ?? "???",
                                textAlign: TextAlign.left,
                                style: const TextStyle(fontSize: 14.0),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 8.0),
                        ClubLogoWidget(
                          imageUrl: match.awayClub.logo!,
                          width: 50,
                          height: 50,
                        )
                      ],
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 8.0),

              // jam pertandingan
              Text(
                convertToWIB(match.time),
                style: const TextStyle(fontSize: 16.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
