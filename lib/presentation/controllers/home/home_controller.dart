import 'package:get/get.dart';
import 'package:liga_inggris_mobile/app/controllers/club/club_controller.dart';
import 'package:liga_inggris_mobile/app/controllers/auth/auth_controller.dart';

class HomeController extends GetxController {
  HomeController();
  final AuthController authController = Get.find();
  final ClubController clubController = Get.find();

  @override
  void onInit() {
    super.onInit();
    clubController.fetchClubs();
  }
}
