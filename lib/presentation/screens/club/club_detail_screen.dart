import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:liga_inggris_mobile/app/controllers/club/club_controller.dart';
import 'package:liga_inggris_mobile/presentation/common/custom_screen_layout.dart';

class ClubDetailScreen extends GetView<ClubController> {
  final String clubId;

  const ClubDetailScreen({super.key, required this.clubId});

  @override
  Widget build(BuildContext context) {
    return CustomScreenLayout(goBackTitle: "Club List", children: [
      Text("club id: $clubId"),
    ]);
  }
}
