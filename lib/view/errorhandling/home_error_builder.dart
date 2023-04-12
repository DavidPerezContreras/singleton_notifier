import 'package:singleton_notifier/model/exception/http_exception.dart';
import 'package:singleton_notifier/view/common/error/error_bundle.dart';
import 'package:singleton_notifier/view/common/error/error_bundle_builder.dart';

class HomeErrorBuilder extends ErrorBundleBuilder {
  HomeErrorBuilder.create(Exception exception, AppAction appAction)
      : super.create(exception, appAction);

  @override
  ErrorBundle handle(HTTPException exception, AppAction appAction) {
    String stringId = 'error_default';
    AppError appError = AppError.UNKNOWN;

    switch (exception.statusCode) {
      case 500:
        stringId = 'error_server';
        break;
    }

    return ErrorBundle(exception, stringId, appAction, appError);
  }
}
