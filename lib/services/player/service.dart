import 'package:liga_inggris_mobile/app/core/base/base_service.dart';
import 'package:liga_inggris_mobile/app/core/handler/service_result.dart';
import 'package:liga_inggris_mobile/app/types/types.dart';
import 'package:liga_inggris_mobile/services/player/model.dart';

class PlayerService extends BaseService {
  Future<ServiceResult<List<PlayerModel>>> getPlayers(
      {QueryParams? params}) async {
    final response = await get('/players', queryParams: params);

    if (response.success) {
      final List<PlayerModel> players = [];

      for (final item in response.data) {
        players.add(PlayerModel.fromJson(item));
      }

      return ServiceResult.success(players);
    } else {
      return ServiceResult.failure(response.message);
    }
  }
}
