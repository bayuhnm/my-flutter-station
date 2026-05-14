import 'dart:io';
import 'package:dio/dio.dart';
import '../errors/failure.dart';

class DioErrorHandler {
  const DioErrorHandler();
  Failure handle(dynamic error) {
    if (error is DioException) {
      switch (error.type) {
        case DioExceptionType.connectionTimeout:
        case DioExceptionType.sendTimeout:
        case DioExceptionType.receiveTimeout: return Failure.timeout();
        case DioExceptionType.badResponse: return _badResponse(error.response);
        case DioExceptionType.connectionError: return Failure.noInternet();
        case DioExceptionType.cancel: return const Failure(title: 'Request Cancelled', message: 'The request was cancelled.');
        case DioExceptionType.badCertificate: return const Failure(title: 'Bad Certificate', message: 'Unable to verify server certificate.');
        case DioExceptionType.unknown:
          if (error.error is SocketException) return Failure.noInternet();
          return Failure.unknown(error);
      }
    }
    return Failure.unknown(error);
  }
  Failure _badResponse(Response<dynamic>? response) {
    final statusCode = response?.statusCode;
    final data = response?.data;
    if (statusCode == 401) return Failure.unauthorized();
    var title = 'Request Failed';
    var message = 'Something went wrong. Please try again.';
    if (data is Map<String, dynamic>) {
      title = data['title']?.toString() ?? title;
      message = data['message']?.toString() ?? data['error']?.toString() ?? data['errors']?.toString() ?? message;
    } else if (data is String && data.trim().isNotEmpty) { message = data; }
    return Failure(title: title, message: message, statusCode: statusCode, rawError: data);
  }
}
