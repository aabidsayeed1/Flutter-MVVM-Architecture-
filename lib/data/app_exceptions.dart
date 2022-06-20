// ignore_for_file: prefer_typing_uninitialized_variables

class AppExceptions implements Exception {
  final _message;
  final _prefix;
  AppExceptions([this._message, this._prefix]);
  @override
  String toString() {
    return '$_prefix$_message';
  }
}

class FetchDataException extends AppExceptions {
  FetchDataException([String? message])
      : super(message, 'Error During Communition');
}

class BadRequentException extends AppExceptions {
  BadRequentException([String? message]) : super(message, 'Invalid requent');
}

class Unauthorisedexception extends AppExceptions {
  Unauthorisedexception([String? message])
      : super(message, 'Unauthorised request');
}

class InvalidInputException extends AppExceptions {
  InvalidInputException([String? message]) : super(message, 'Invalid Input');
}
