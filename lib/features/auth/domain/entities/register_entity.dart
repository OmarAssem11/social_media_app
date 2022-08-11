import 'package:freezed_annotation/freezed_annotation.dart';

part 'register_entity.freezed.dart';

@freezed
class RegisterEntity with _$RegisterEntity {
  const factory RegisterEntity({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
  }) = _RegisterEntity;
}
