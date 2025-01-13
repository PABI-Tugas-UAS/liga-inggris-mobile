import 'package:get/get.dart';
import 'package:liga_inggris_mobile/app/controllers/auth/auth_controller.dart';

class NotificationBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(()=> AuthController());
  }
}