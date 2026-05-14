class Failure {
  final String title;
  final String message;
  final int? statusCode;
  final dynamic rawError;
  const Failure({this.title = 'Something went wrong', required this.message, this.statusCode, this.rawError});
  factory Failure.unknown([dynamic error]) => Failure(title: 'Unexpected Error', message: 'An unexpected error occurred. Please try again.', rawError: error);
  factory Failure.noInternet() => const Failure(title: 'No Internet Connection', message: 'Please check your internet connection and try again.');
  factory Failure.timeout() => const Failure(title: 'Connection Timeout', message: 'The server took too long to respond. Please try again.');
  factory Failure.unauthorized() => const Failure(title: 'Session Expired', message: 'Your session has expired. Please login again.', statusCode: 401);
  @override
  String toString() => 'Failure(title: $title, message: $message, statusCode: $statusCode)';
}
