class ApiResponse<T> {
  final bool success;
  final int statusCode;
  final String message;
  final T? data;

  ApiResponse({
    required this.success,
    required this.statusCode,
    required this.message,
    this.data,
  });

  factory ApiResponse.fromJson(Map<String, dynamic> json) {
    return ApiResponse(
      success: json['success'],
      statusCode: 0,
      message: json['message'],
      data: json['data'],
    );
  }

  static String getErrMessage(dynamic error) {
    return error is ApiResponse ? error.message : 'Unknown error occurred';
  }
}
