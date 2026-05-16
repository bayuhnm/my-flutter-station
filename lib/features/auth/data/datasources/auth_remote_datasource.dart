import '../../../../core/network/core_api_service.dart';
import '../models/auth_user_model.dart';

abstract class AuthRemoteDataSource {
  Future<AuthUserModel> login({required String email, required String password});
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final CoreApiService apiService;

  const AuthRemoteDataSourceImpl({required this.apiService});

  @override
  Future<AuthUserModel> login({required String email, required String password}) async {
    // Demo endpoint supaya template langsung bisa jalan.
    // Ganti dengan: await apiService.post('/auth/login', data: {...}) ketika backend sudah siap.
    await apiService.get('/users/1');
    await Future<void>.delayed(const Duration(milliseconds: 450));

    if (email.trim().isEmpty || password.trim().isEmpty) {
      throw Exception('Email and password are required.');
    }

    return AuthUserModel.fromJson({
      'id': 1,
      'name': 'Station Trader',
      'email': email,
      'token': 'demo-token-my-flutter-station',
    });
  }
}
