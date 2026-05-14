import 'package:dio/dio.dart';
import '../constants/app_constants.dart';
import '../storage/token_storage.dart';

class AuthInterceptor extends Interceptor {
  final TokenStorage tokenStorage;
  AuthInterceptor({required this.tokenStorage});
  @override
  Future<void> onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    final requiredToken = options.extra['required_token'] != false;
    if (requiredToken) {
      final token = await tokenStorage.getToken();
      if (token != null && token.isNotEmpty) options.headers['Authorization'] = '${AppConstants.bearerPrefix} $token';
    }
    options.headers['Accept'] = 'application/json';
    if (options.data != null && options.data is! FormData) options.headers['Content-Type'] = 'application/json';
    super.onRequest(options, handler);
  }
}
