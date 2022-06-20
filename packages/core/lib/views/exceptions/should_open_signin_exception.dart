class ShouldOpenSignInException implements Exception {
  ShouldOpenSignInException({this.message});

  final String? message;

  @override
  String toString() {
    return 'ShouldOpenSignInException{message: $message}';
  }
}
