import 'package:dio/dio.dart';
import '../config/app_config.dart';
import 'api_result.dart';
import 'dio_error_handler.dart';

class CoreApiService {
  final Dio dio;
  final DioErrorHandler dioErrorHandler;
  CoreApiService({required this.dio, required this.dioErrorHandler}) {
    dio.options = BaseOptions(
      baseUrl: AppConfig.baseUrl,
      connectTimeout: AppConfig.connectTimeout,
      receiveTimeout: AppConfig.receiveTimeout,
      responseType: ResponseType.json,
    );
  }
  Future<ApiResult<Response<dynamic>>> get(String path,{Map<String,dynamic>? queryParameters,Options? options,bool requiredToken=true}) async {
    try { return ApiSuccess(await dio.get<dynamic>(path, queryParameters: queryParameters, options: _options(options, requiredToken))); }
    catch(e){ return ApiFailure(dioErrorHandler.handle(e)); }
  }
  Future<ApiResult<Response<dynamic>>> post(String path,{dynamic data,Map<String,dynamic>? queryParameters,Options? options,bool requiredToken=true}) async {
    try { return ApiSuccess(await dio.post<dynamic>(path, data: data, queryParameters: queryParameters, options: _options(options, requiredToken))); }
    catch(e){ return ApiFailure(dioErrorHandler.handle(e)); }
  }
  Future<ApiResult<Response<dynamic>>> put(String path,{dynamic data,Map<String,dynamic>? queryParameters,Options? options,bool requiredToken=true}) async {
    try { return ApiSuccess(await dio.put<dynamic>(path, data: data, queryParameters: queryParameters, options: _options(options, requiredToken))); }
    catch(e){ return ApiFailure(dioErrorHandler.handle(e)); }
  }
  Future<ApiResult<Response<dynamic>>> delete(String path,{dynamic data,Map<String,dynamic>? queryParameters,Options? options,bool requiredToken=true}) async {
    try { return ApiSuccess(await dio.delete<dynamic>(path, data: data, queryParameters: queryParameters, options: _options(options, requiredToken))); }
    catch(e){ return ApiFailure(dioErrorHandler.handle(e)); }
  }
  Options _options(Options? options, bool requiredToken) => (options ?? Options()).copyWith(extra: {...?options?.extra, 'required_token': requiredToken});
}
