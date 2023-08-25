// contain custom  exceptions classes for handling errors
class ServerException implements Exception {
  final String message;
  ServerException(this.message);
  @override
  String toString() {
    // return super.toString();
    return 'ServerException: $message';
  }
}

class NetworkException implements Exception {
  final String message;
  NetworkException(this.message);
  @override
  String toString() {
    return 'NetWorkException: $message';
  }
}
