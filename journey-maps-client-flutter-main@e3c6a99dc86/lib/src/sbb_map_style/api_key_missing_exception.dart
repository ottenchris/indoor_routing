// coverage:ignore-file
class ApiKeyMissing implements Exception {
  final String message;

  ApiKeyMissing(this.message);

  @override
  String toString() {
    return 'ApiKeyMissing: $message';
  }
}
