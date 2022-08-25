import 'package:freezed_annotation/freezed_annotation.dart';
part 'utility_state.freezed.dart';

@freezed
class UtilityState with _$UtilityState {
  factory UtilityState.initial() = UtilityInitial;
}
