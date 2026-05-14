part of 'auth_bloc.dart';
sealed class AuthEvent extends Equatable { const AuthEvent(); @override List<Object?> get props => []; }
class AuthStarted extends AuthEvent { const AuthStarted(); }
class AuthLoginSubmitted extends AuthEvent { final String email; final String password; const AuthLoginSubmitted({required this.email, required this.password}); @override List<Object?> get props => [email, password]; }
class AuthLogoutRequested extends AuthEvent { const AuthLogoutRequested(); }
class AuthErrorCleared extends AuthEvent { const AuthErrorCleared(); }
