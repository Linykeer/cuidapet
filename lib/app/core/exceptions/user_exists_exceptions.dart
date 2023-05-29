class UserExistsExceptions implements Exception {
  final String? message;

  UserExistsExceptions([
    this.message,
  ]);
}
