abstract class UserFailure implements Exception {
  abstract final String message;
}

class UserFailureInternet implements UserFailure {
  const UserFailureInternet(this.message);

  @override
  final String message;
}
