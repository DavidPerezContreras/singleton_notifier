enum AppAction { SIGN_IN, GET_MOVIES }

enum AppError { UNKNOWN, NONE, NO_INTERNET, TIMEOUT }

class ErrorBundle {
  final Exception exception;
  final String stringId;
  final AppAction appAction;
  final AppError appError;

  ErrorBundle(this.exception, this.stringId, this.appAction, this.appError);

  String get message {
    return exception.toString();
  }
}
