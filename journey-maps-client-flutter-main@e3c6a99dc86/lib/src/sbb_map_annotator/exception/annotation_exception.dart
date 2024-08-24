class AnnotationException implements Exception {
  final String msg;

  const AnnotationException([this.msg = '']);

  @override
  String toString() => 'UpdateAnnotationException: $msg';
}
