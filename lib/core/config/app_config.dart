class AppConfig {
  const AppConfig._();
  static const String appName = 'My Flutter Station';
  static const String baseUrl = 'https://jsonplaceholder.typicode.com';
  static const Duration connectTimeout = Duration(seconds: 30);
  static const Duration receiveTimeout = Duration(seconds: 30);
}
