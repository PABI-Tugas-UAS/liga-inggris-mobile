import 'package:get/get.dart';
import 'package:liga_inggris_mobile/app/controllers/match/match_controller.dart';
import 'package:liga_inggris_mobile/presentation/controllers/match/match_controller.dart';

class MatchPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MatchController());
    Get.put(MatchPageController());
  }
}
