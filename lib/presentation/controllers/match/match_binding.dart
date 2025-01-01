import 'package:get/get.dart';
import 'package:liga_inggris_mobile/app/controllers/match/match_controller.dart';
import 'package:liga_inggris_mobile/app/controllers/player/player_controller.dart';
import 'package:liga_inggris_mobile/presentation/controllers/match/match_page_controller.dart';

class MatchPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MatchController());
    Get.lazyPut(() => PlayerController());
    Get.put(MatchPageController());
  }
}
