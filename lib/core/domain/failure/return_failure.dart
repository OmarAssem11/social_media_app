import 'package:social_media_app/core/data/exceptions/app_exception.dart';
import 'package:social_media_app/core/domain/failure/failure.dart';

Failure returnFailure(AppException appException) {
  if (appException is RemoteAppException) {
    return appException.map(
      unknown: (_) => const RemoteFailure.unKnown(),
    );
  } else {
    appException as LocalAppException;
    return appException.map(
      canNotAccess: (_) => const LocalFailure.canNotAccess(),
    );
  }
}
