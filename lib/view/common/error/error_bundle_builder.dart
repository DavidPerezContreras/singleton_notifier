import 'dart:async';
import 'dart:io';

import 'package:singleton_notifier/model/exception/http_exception.dart';
import 'package:singleton_notifier/view/common/error/error_bundle.dart';



abstract class ErrorBundleBuilder {
  final Exception exception;
  final AppAction appAction;

  ErrorBundleBuilder.create(this.exception, this.appAction);

  ErrorBundle handle(HTTPException exception, AppAction appAction);

  ErrorBundle build() {
    String stringId = 'error_default';
    AppError appError = AppError.UNKNOWN;

    switch (exception.runtimeType) {
      case HTTPException:
        return handle((exception as HTTPException), appAction);
      case TimeoutException:
        stringId = 'error_timeout';
        appError = AppError.TIMEOUT;
        break;
      case SocketException:
        stringId = 'error_no_internet';
        appError = AppError.NO_INTERNET;
        break;
    }

    return ErrorBundle(exception, stringId, appAction, appError);
  }
}