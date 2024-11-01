class AppExceptions implements Exception {
  final _message;
  final _prefix;

  AppExceptions([this._message, this._prefix]);

  @override
  toString() {
    return "$_prefix $_message";
  }
}

class FirebaseNetworkException extends AppExceptions {
  FirebaseNetworkException([String? message]) : super('', "Network Error:");
}

class FirebasePermissionException extends AppExceptions {
  FirebasePermissionException([String? message]) : super('', "Permission Error:");
}

class FirebaseInvalidCredentialException extends AppExceptions {
  FirebaseInvalidCredentialException([String? message]) : super('', "Invalid Credentials Error:");
}

class FirebaseUserNotFoundException extends AppExceptions {
  FirebaseUserNotFoundException([String? message]) : super('', "User Not Found:");
}

class FirebaseTooManyRequestsException extends AppExceptions {
  FirebaseTooManyRequestsException([String? message]) : super('', "Too Many Requests:");
}

class FirebaseOperationNotAllowedException extends AppExceptions {
  FirebaseOperationNotAllowedException([String? message]) : super('', "Operation Not Allowed:");
}

class FirebaseDatabaseException extends AppExceptions {
  FirebaseDatabaseException([String? message]) : super('', "Database Error:");
}

class FirebaseStorageException extends AppExceptions {
  FirebaseStorageException([String? message]) : super('', "Storage Error:");
}

class GeneralException extends AppExceptions {
  GeneralException([String? message]) : super('', "Unknown error occurred");
}
