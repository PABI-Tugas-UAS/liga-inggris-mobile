import 'package:get/get.dart';
import 'package:liga_inggris_mobile/app/controllers/club/club_controller.dart';
import 'package:liga_inggris_mobile/app/controllers/auth/auth_controller.dart';
import 'package:liga_inggris_mobile/app/controllers/match/match_controller.dart';

class HomeController extends GetxController {
  final AuthController authController = Get.find();
  final ClubController clubController = Get.find();
  final MatchController matchController = Get.find();

  @override
  void onInit() {
    super.onInit();
    clubController.fetchClubs();
    clubController.fetchTopClubs();
    matchController.fetchCurrentMatches();
    matchController.fetchUpcomingMatches();
  }
}
