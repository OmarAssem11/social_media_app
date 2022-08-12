import 'package:fluttertoast/fluttertoast.dart';
import 'package:social_media_app/core/presentation/resources/strings_manager.dart';

void showErrorToast([String? message]) => Fluttertoast.showToast(
      msg: message ?? AppStrings.somethingWentWrong,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
    );
