import 'package:get/get.dart';
import 'package:liga_inggris_mobile/app/controllers/match/match_controller.dart';

class MatchPageController extends GetxController {
  MatchPageController();
  final MatchController matchController = Get.find();

  @override
  void onInit() {
    super.onInit();
    matchController.fetchMatches();
  }
}
