import 'package:get/get.dart';
import 'package:liga_inggris_mobile/app/controllers/auth/auth_controller.dart';
import 'package:liga_inggris_mobile/app/controllers/club/club_controller.dart';
import 'package:liga_inggris_mobile/presentation/controllers/profile/profile_page_controller.dart';

class ProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthController());
    Get.lazyPut(() => ClubController());
    Get.put(ProfilePageController());
  }
}
