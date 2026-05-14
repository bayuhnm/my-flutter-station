import '../../../../core/network/api_result.dart';
import '../entities/user_entity.dart';
import '../repositories/auth_repository.dart';
class GetProfileUseCase { final AuthRepository repository; const GetProfileUseCase(this.repository); Future<ApiResult<UserEntity>> call() => repository.getProfile(); }
