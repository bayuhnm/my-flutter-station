import '../entities/auth_user.dart';
import '../repositories/auth_repository.dart';

class LoginUseCase {
  final AuthRepository repository;

  const LoginUseCase({required this.repository});

  Future<AuthUser> call({required String email, required String password}) {
    return repository.login(email: email, password: password);
  }
}
