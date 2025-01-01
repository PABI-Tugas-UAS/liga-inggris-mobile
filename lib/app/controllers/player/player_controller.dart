import 'package:get/get.dart';
import 'package:liga_inggris_mobile/app/types/types.dart';
import 'package:liga_inggris_mobile/services/player/model.dart';
import 'package:liga_inggris_mobile/services/player/service.dart';

class PlayerController extends GetxController {
  PlayerController();

  final PlayerService _playerService = PlayerService();
  var players = RxList<PlayerModel>([]);
  var isPlayersLoading = false.obs;

  Future<void> fetchPlayers({QueryParams? params}) async {
    isPlayersLoading(true);
    final res = await _playerService.getPlayers(params: params);

    if (res.isSuccess) {
      players.assignAll(res.data ?? []);
    } else {
      Get.snackbar(
        'Players',
        res.errMessage ?? 'Failed to fetch players',
        snackPosition: SnackPosition.TOP,
      );
    }

    isPlayersLoading(false);
  }
}
