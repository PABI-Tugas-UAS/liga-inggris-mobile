class ServiceResult<T> {
  final bool success;
  final T? data;
  final String? errMessage;

  ServiceResult._({
    this.data,
    this.errMessage,
    required this.success,
  });

  factory ServiceResult.success(
    T data,
  ) =>
      ServiceResult._(data: data, success: true);

  factory ServiceResult.failure(String msg) =>
      ServiceResult._(errMessage: msg, success: false);

  bool get isSuccess => !isFailure;
  bool get isFailure => !success;
}
