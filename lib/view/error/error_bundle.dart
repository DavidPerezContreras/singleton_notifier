enum AppAction { SIGN_IN, GET_ARTISTS }

enum AppError { UNKNOWN, NONE, NO_INTERNET, TIMEOUT }

class ErrorBundle {
  final Exception exception;
  final String stringId;
  final AppAction appAction;
  final AppError appError;

  ErrorBundle(this.exception, this.appAction, this.appError)
      : stringId = appError.toString();

  String get message {
    return exception.toString();
  }
}
