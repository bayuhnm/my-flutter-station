import '../../../../core/errors/failure.dart';
import '../../domain/entities/auth_user.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/auth_remote_datasource.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;

  const AuthRepositoryImpl({required this.remoteDataSource});

  @override
  Future<AuthUser> login({required String email, required String password}) async {
    try {
      return await remoteDataSource.login(email: email, password: password);
    } on Failure {
      rethrow;
    } catch (e) {
      throw Failure(message: e.toString().replaceFirst('Exception: ', ''));
    }
  }
}
