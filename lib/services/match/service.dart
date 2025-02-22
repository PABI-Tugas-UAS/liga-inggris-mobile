import 'package:liga_inggris_mobile/app/core/base/base_service.dart';
import 'package:liga_inggris_mobile/app/core/handler/service_result.dart';
import 'package:liga_inggris_mobile/app/types/types.dart';
import 'package:liga_inggris_mobile/services/match/model.dart';

class MatchService extends BaseService {
  Future<ServiceResult<List<MatchModel>>> getMatches(
      {QueryParams? params}) async {
    final response = await get('/matches', queryParams: params);

    if (response.success) {
      final List<MatchModel> matches = [];

      for (final item in response.data) {
        matches.add(MatchModel.fromJson(item));
      }

      return ServiceResult.success(matches);
    } else {
      return ServiceResult.failure(response.message);
    }
  }

  Future<ServiceResult<MatchDetailModel>> getMatchById(String matchId) async {
    final response = await get('/matches/$matchId');

    if (response.success) {
      final parsedData = MatchDetailModel.fromJson(response.data);

      return ServiceResult.success(parsedData);
    } else {
      return ServiceResult.failure(response.message);
    }
  }
}
