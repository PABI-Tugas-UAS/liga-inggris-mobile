import 'package:get/get.dart';
import 'package:liga_inggris_mobile/app/controllers/match/match_controller.dart';
import 'package:liga_inggris_mobile/app/controllers/player/player_controller.dart';

class MatchPageController extends GetxController {
  MatchPageController();
  final MatchController matchController = Get.find();
  final PlayerController playerController = Get.find();

  @override
  void onInit() {
    super.onInit();
    matchController.fetchMatches();
  }

  void goToMatchDetail(int matchId) {
    matchController.fetchMatchDetails(matchId.toString());

    Get.toNamed('/match/$matchId');
  }
}
