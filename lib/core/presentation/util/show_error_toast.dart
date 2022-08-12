import 'package:fluttertoast/fluttertoast.dart';
import 'package:social_media_app/generated/l10n.dart';

void showErrorToast([String? message]) => Fluttertoast.showToast(
      msg: message ?? S.current.somethingWentWrong,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
    );
