import 'package:firebase_core/firebase_core.dart';
import 'package:social_media_app/core/data/exceptions/app_exception.dart';

RemoteAppException returnRemoteAppException(Object exception) {
  if (exception is FirebaseException) {
    switch (exception.code) {
      default:
        return const RemoteAppException.unknown();
    }
  } else {
    return const RemoteAppException.unknown();
  }
}

LocalAppException returnLocalAppException(Object exception) {
  return const LocalAppException.canNotAccess();
}
