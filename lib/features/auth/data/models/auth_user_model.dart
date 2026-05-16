import '../../domain/entities/auth_user.dart';

class AuthUserModel extends AuthUser {
  const AuthUserModel({
    required super.id,
    required super.name,
    required super.email,
    required super.token,
  });

  factory AuthUserModel.fromJson(Map<String, dynamic> json) {
    return AuthUserModel(
      id: json['id'] as int? ?? 1,
      name: json['name'] as String? ?? 'Station Trader',
      email: json['email'] as String? ?? 'station@crypto.dev',
      token: json['token'] as String? ?? 'demo-token',
    );
  }
}
