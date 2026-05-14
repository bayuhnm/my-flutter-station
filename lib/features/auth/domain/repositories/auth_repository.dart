import '../../../../core/network/api_result.dart';
import '../entities/user_entity.dart';
abstract class AuthRepository { Future<ApiResult<UserEntity>> login({required String email, required String password}); Future<ApiResult<UserEntity>> getProfile(); Future<void> logout(); }
