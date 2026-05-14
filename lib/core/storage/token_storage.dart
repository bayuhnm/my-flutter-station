import 'package:shared_preferences/shared_preferences.dart';

abstract class TokenStorage {
  Future<void> saveToken(String token);
  Future<String?> getToken();
  Future<void> clearToken();
}

class TokenStorageImpl implements TokenStorage {
  static const String _tokenKey = 'access_token';
  final SharedPreferences sharedPreferences;
  TokenStorageImpl(this.sharedPreferences);
  @override
  Future<void> saveToken(String token) async =>
      sharedPreferences.setString(_tokenKey, token);
  @override
  Future<String?> getToken() async => sharedPreferences.getString(_tokenKey);
  @override
  Future<void> clearToken() async => sharedPreferences.remove(_tokenKey);
}
