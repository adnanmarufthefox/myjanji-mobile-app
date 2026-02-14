/// Generic API Response wrapper
class ApiResponse<T> {
  final T? data;
  final String? message;
  final bool success;
  final String? error;

  ApiResponse({
    this.data,
    this.message,
    this.success = false,
    this.error,
  });

  factory ApiResponse.success(T data, {String? message}) {
    return ApiResponse(
      data: data,
      message: message,
      success: true,
    );
  }

  factory ApiResponse.error(String error) {
    return ApiResponse(
      error: error,
      success: false,
    );
  }

  factory ApiResponse.loading() {
    return ApiResponse(success: false);
  }
}