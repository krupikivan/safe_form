class CustomException implements Exception {
  CustomException(this._message, this._prefix);

  final String _message;
  final String _prefix;

  @override
  String toString() {
    return '$_prefix$_message';
  }

  Map<String, String> toJson() => {};
}

class FetchDataException extends CustomException {
  FetchDataException([String? message])
      : super(message!, 'Error During Communication: ');
}

class BadRequestException extends CustomException {
  BadRequestException([String? message]) : super(message!, 'Invalid Request: ');
}
