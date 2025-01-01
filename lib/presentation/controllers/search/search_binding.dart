import 'package:get/get.dart';
import 'package:liga_inggris_mobile/app/controllers/club/club_controller.dart';

class SearchPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ClubController());
  }
}