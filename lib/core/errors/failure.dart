class Failure implements Exception {
  final String title;
  final String message;
  final int? statusCode;

  const Failure({
    this.title = 'Something went wrong',
    required this.message,
    this.statusCode,
  });

  @override
  String toString() => 'Failure(title: $title, message: $message, statusCode: $statusCode)';
}
