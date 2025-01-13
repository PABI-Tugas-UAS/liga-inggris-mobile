import 'package:get/get.dart';
import 'package:liga_inggris_mobile/app/controllers/club/club_controller.dart';
import 'package:liga_inggris_mobile/app/controllers/auth/auth_controller.dart';
import 'package:liga_inggris_mobile/app/controllers/match/match_controller.dart';
import 'package:liga_inggris_mobile/app/controllers/player/player_controller.dart';

class HomeController extends GetxController {
  final AuthController authController = Get.find();
  final ClubController clubController = Get.find();
  final MatchController matchController = Get.find();
  final PlayerController playerController = Get.find();

  @override
  void onInit() {
    super.onInit();
    Future.wait([
      clubController.fetchClubs(),
      clubController.fetchTopClubs(),
      matchController.fetchCurrentMatches(),
      matchController.fetchUpcomingMatches(),
    ]);
  }

  void goToMatchDetail(int matchId) {
    matchController.fetchMatchDetails(matchId.toString());
    playerController.fetchPlayers(clubId: "1");

    Get.toNamed('/match/$matchId');
  }

  void goToClubDetail(int clubId) {
    clubController.fetchClubDetails(clubId.toString());

    Get.toNamed('/clubs/$clubId');
  }

  void onRefreshPage() {
    clubController.fetchClubs();
    clubController.fetchTopClubs();
    matchController.fetchCurrentMatches();
    matchController.fetchUpcomingMatches();
  }
}
