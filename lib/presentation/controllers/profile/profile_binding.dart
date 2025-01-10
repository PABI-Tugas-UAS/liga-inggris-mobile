import 'package:get/get.dart';
import 'package:liga_inggris_mobile/presentation/controllers/profile/profile_page_controller.dart';

class ProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ProfilePageController());
  }
}
