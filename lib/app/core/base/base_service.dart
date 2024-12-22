import 'package:liga_inggris_mobile/app/instances/api_instance.dart';
import 'package:liga_inggris_mobile/app/core/handler/service_result.dart';

class BaseService extends ApiInstance {
  Future<ServiceResult<T>> handleResponse<T>(
    Future<dynamic> Function() reqFunc,
    T Function(dynamic data) fromJsonFunc,
  ) async {
    final response = await reqFunc();

    if (response.success) {
      return ServiceResult.success(fromJsonFunc(response.data));
    } else {
      return ServiceResult.failure(response.message);
    }
  }
}
