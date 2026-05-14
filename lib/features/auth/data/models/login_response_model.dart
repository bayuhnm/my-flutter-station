import 'user_model.dart';
class LoginResponseModel {
  final String token; final UserModel user;
  const LoginResponseModel({required this.token, required this.user});
  factory LoginResponseModel.fromJson(Map<String, dynamic> json) {
    final data = json['data'] is Map<String, dynamic> ? json['data'] as Map<String, dynamic> : json;
    return LoginResponseModel(token: data['token']?.toString() ?? data['access_token']?.toString() ?? '', user: UserModel.fromJson(data['user'] is Map<String,dynamic> ? data['user'] as Map<String,dynamic> : <String,dynamic>{}));
  }
}
