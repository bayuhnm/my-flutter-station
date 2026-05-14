import '../../../../core/errors/failure.dart';
import '../../../../core/network/core_api_service.dart';
import '../models/login_request_model.dart';
import '../models/login_response_model.dart';
import '../models/user_model.dart';

abstract class AuthRemoteDataSource { Future<LoginResponseModel> login(LoginRequestModel request); Future<UserModel> getProfile(); }
class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final CoreApiService apiService; AuthRemoteDataSourceImpl({required this.apiService});
  @override Future<LoginResponseModel> login(LoginRequestModel request) async {
    final result = await apiService.post('/auth/login', data: request.toJson(), requiredToken: false);
    return result.when(success: (response) { if (response.data is Map<String,dynamic>) return LoginResponseModel.fromJson(response.data as Map<String,dynamic>); throw const Failure(title: 'Invalid Response', message: 'Login response format is invalid.'); }, failure: (failure) => throw failure);
  }
  @override Future<UserModel> getProfile() async {
    final result = await apiService.get('/auth/profile');
    return result.when(success: (response) { final body=response.data; if (body is Map<String,dynamic>) { final data = body['data'] is Map<String,dynamic> ? body['data'] as Map<String,dynamic> : body; return UserModel.fromJson(data); } throw const Failure(title: 'Invalid Response', message: 'Profile response format is invalid.'); }, failure: (failure) => throw failure);
  }
}
