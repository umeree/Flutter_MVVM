class AppExcetions implements Exception {
  final _message;
  final _prefix;

  AppExcetions([this._message, this._prefix]);

  String toString() {
    return '$_message$_prefix';
  }
}

class FetchDataException extends AppExcetions{
  FetchDataException([String? message]):super(message, 'Error during Communication');
}

class BadRequestException extends AppExcetions{
  BadRequestException([String? message]):super(message, 'Invalid request');
}

class UnauthorizedException extends AppExcetions{
  UnauthorizedException([String? message]):super(message, 'Unauthorized request');
}

class InvalidInputException extends AppExcetions{
  InvalidInputException([String? message]):super(message, 'Invalid Input');
}