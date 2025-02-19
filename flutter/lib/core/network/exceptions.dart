
class ServerException implements Exception {

  final String message;

  const ServerException([this.message = 'server error']);

  @override
  String toString() {
    return message;
  }
}


class ConnectionError implements Exception {


  const ConnectionError();

  @override
  String toString() {
    return 'fail , no internet connection!!';
  }
}