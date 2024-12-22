import 'package:liga_inggris_mobile/app/core/base/base_service.dart';
import 'package:liga_inggris_mobile/app/core/handler/service_result.dart';
import 'package:liga_inggris_mobile/app/types/types.dart';
import 'package:liga_inggris_mobile/services/club/model.dart';

class ClubService extends BaseService {
  Future<ServiceResult<List<ClubModel>>> getClubs({QueryParams? params}) async {
    final response = await get('/clubs', queryParams: params);

    if (response.success) {
      final List<ClubModel> clubs = [];

      for (final item in response.data) {
        clubs.add(ClubModel.fromJson(item));
      }

      return ServiceResult.success(clubs);
    } else {
      return ServiceResult.failure(response.message);
    }
  }
}
