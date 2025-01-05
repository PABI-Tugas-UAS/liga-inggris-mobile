import 'package:get/get.dart';
import 'package:liga_inggris_mobile/app/types/types.dart';
import 'package:liga_inggris_mobile/services/club/model.dart';
import 'package:liga_inggris_mobile/services/club/service.dart';

class ClubController extends GetxController {
  ClubController();

  final ClubService _clubService = ClubService();
  var isLoading = false.obs;
  var clubs = RxList<ClubModel>([]);
  var searchClub = Rxn<ClubModel>();

  Future<void> fetchClubs({QueryParams? params}) async {
    clubs.clear();
    isLoading(true);
    final res = await _clubService.getClubs(params: params);

    if (res.isSuccess) {
      clubs.assignAll(res.data ?? []);
    } else {
      Get.snackbar(
        'Clubs',
        res.errMessage ?? 'Failed to fetch clubs',
        snackPosition: SnackPosition.TOP,
      );
    }
    isLoading(false);
  }
}
