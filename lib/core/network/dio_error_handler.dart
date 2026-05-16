import 'package:dio/dio.dart';

import '../errors/failure.dart';

class DioErrorHandler {
  const DioErrorHandler._();

  static Failure handle(DioException error) {
    final statusCode = error.response?.statusCode;
    final data = error.response?.data;

    String message = 'Please try again in a moment.';
    String title = 'Request Failed';

    if (data is Map<String, dynamic>) {
      message = _extractMessage(data) ?? message;
      title = _extractTitle(data) ?? title;
    }

    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return const Failure(
          title: 'Connection Timeout',
          message: 'The server took too long to respond. Please check your connection.',
        );
      case DioExceptionType.badResponse:
        return Failure(
          title: _titleByStatus(statusCode) ?? title,
          message: message,
          statusCode: statusCode,
        );
      case DioExceptionType.cancel:
        return const Failure(title: 'Request Cancelled', message: 'The request was cancelled.');
      case DioExceptionType.connectionError:
        return const Failure(
          title: 'No Internet Connection',
          message: 'Please check your internet connection and try again.',
        );
      case DioExceptionType.badCertificate:
        return const Failure(title: 'Security Error', message: 'The certificate is not trusted.');
      case DioExceptionType.unknown:
        return Failure(message: error.message ?? message);
    }
  }

  static String? _extractMessage(Map<String, dynamic> data) {
    final value = data['message'] ?? data['error'] ?? data['detail'];
    if (value is String && value.trim().isNotEmpty) return value;
    if (value is List && value.isNotEmpty) return value.join('\n');
    return null;
  }

  static String? _extractTitle(Map<String, dynamic> data) {
    final value = data['title'];
    if (value is String && value.trim().isNotEmpty) return value;
    return null;
  }

  static String? _titleByStatus(int? code) {
    switch (code) {
      case 400:
        return 'Invalid Request';
      case 401:
        return 'Session Expired';
      case 403:
        return 'Access Denied';
      case 404:
        return 'Data Not Found';
      case 422:
        return 'Validation Failed';
      case 500:
        return 'Server Error';
      default:
        return null;
    }
  }
}
