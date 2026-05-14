import '../../../../core/errors/failure.dart';
import '../../../../core/network/api_result.dart';
import '../../../../core/storage/token_storage.dart';
import '../../domain/entities/user_entity.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/auth_remote_datasource.dart';
import '../models/login_request_model.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource; final TokenStorage tokenStorage;
  AuthRepositoryImpl({required this.remoteDataSource, required this.tokenStorage});
  @override Future<ApiResult<UserEntity>> login({required String email, required String password}) async { try { final response = await remoteDataSource.login(LoginRequestModel(email: email, password: password)); await tokenStorage.saveToken(response.token); return ApiSuccess(response.user); } on Failure catch(f) { return ApiFailure(f); } catch(e) { return ApiFailure(Failure.unknown(e)); } }
  @override Future<ApiResult<UserEntity>> getProfile() async { try { return ApiSuccess(await remoteDataSource.getProfile()); } on Failure catch(f) { return ApiFailure(f); } catch(e) { return ApiFailure(Failure.unknown(e)); } }
  @override Future<void> logout() => tokenStorage.clearToken();
}
