import 'package:social_media_app/generated/l10n.dart';

extension FormattedTimeFromNow on DateTime {
  String get formattedTimeFromNow {
    final durationFromNow = DateTime.now().difference(this);
    print(this);
    print(durationFromNow.inDays);
    if (durationFromNow < const Duration(days: 1)) {
      return '${durationFromNow.inHours ~/ 60}${S.current.h}';
    } else if (durationFromNow < const Duration(days: 7)) {
      return '${durationFromNow.inDays}${S.current.d}';
    } else if (durationFromNow < const Duration(days: 30)) {
      return '${durationFromNow.inDays ~/ 7}${S.current.w}';
    } else if (durationFromNow < const Duration(days: 365)) {
      return '${durationFromNow.inDays ~/ 30}${S.current.m}';
    } else {
      return '${durationFromNow.inDays ~/ 365}${S.current.y}';
    }
  }
}
