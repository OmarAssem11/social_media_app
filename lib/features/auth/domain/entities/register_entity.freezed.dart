// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'register_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$RegisterEntity {
  String get firstName => throw _privateConstructorUsedError;
  String get lastName => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RegisterEntityCopyWith<RegisterEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RegisterEntityCopyWith<$Res> {
  factory $RegisterEntityCopyWith(
          RegisterEntity value, $Res Function(RegisterEntity) then) =
      _$RegisterEntityCopyWithImpl<$Res>;
  $Res call({String firstName, String lastName, String email, String password});
}

/// @nodoc
class _$RegisterEntityCopyWithImpl<$Res>
    implements $RegisterEntityCopyWith<$Res> {
  _$RegisterEntityCopyWithImpl(this._value, this._then);

  final RegisterEntity _value;
  // ignore: unused_field
  final $Res Function(RegisterEntity) _then;

  @override
  $Res call({
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? email = freezed,
    Object? password = freezed,
  }) {
    return _then(_value.copyWith(
      firstName: firstName == freezed
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: lastName == freezed
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_RegisterEntityCopyWith<$Res>
    implements $RegisterEntityCopyWith<$Res> {
  factory _$$_RegisterEntityCopyWith(
          _$_RegisterEntity value, $Res Function(_$_RegisterEntity) then) =
      __$$_RegisterEntityCopyWithImpl<$Res>;
  @override
  $Res call({String firstName, String lastName, String email, String password});
}

/// @nodoc
class __$$_RegisterEntityCopyWithImpl<$Res>
    extends _$RegisterEntityCopyWithImpl<$Res>
    implements _$$_RegisterEntityCopyWith<$Res> {
  __$$_RegisterEntityCopyWithImpl(
      _$_RegisterEntity _value, $Res Function(_$_RegisterEntity) _then)
      : super(_value, (v) => _then(v as _$_RegisterEntity));

  @override
  _$_RegisterEntity get _value => super._value as _$_RegisterEntity;

  @override
  $Res call({
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? email = freezed,
    Object? password = freezed,
  }) {
    return _then(_$_RegisterEntity(
      firstName: firstName == freezed
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: lastName == freezed
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_RegisterEntity implements _RegisterEntity {
  const _$_RegisterEntity(
      {required this.firstName,
      required this.lastName,
      required this.email,
      required this.password});

  @override
  final String firstName;
  @override
  final String lastName;
  @override
  final String email;
  @override
  final String password;

  @override
  String toString() {
    return 'RegisterEntity(firstName: $firstName, lastName: $lastName, email: $email, password: $password)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RegisterEntity &&
            const DeepCollectionEquality().equals(other.firstName, firstName) &&
            const DeepCollectionEquality().equals(other.lastName, lastName) &&
            const DeepCollectionEquality().equals(other.email, email) &&
            const DeepCollectionEquality().equals(other.password, password));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(firstName),
      const DeepCollectionEquality().hash(lastName),
      const DeepCollectionEquality().hash(email),
      const DeepCollectionEquality().hash(password));

  @JsonKey(ignore: true)
  @override
  _$$_RegisterEntityCopyWith<_$_RegisterEntity> get copyWith =>
      __$$_RegisterEntityCopyWithImpl<_$_RegisterEntity>(this, _$identity);
}

abstract class _RegisterEntity implements RegisterEntity {
  const factory _RegisterEntity(
      {required final String firstName,
      required final String lastName,
      required final String email,
      required final String password}) = _$_RegisterEntity;

  @override
  String get firstName => throw _privateConstructorUsedError;
  @override
  String get lastName => throw _privateConstructorUsedError;
  @override
  String get email => throw _privateConstructorUsedError;
  @override
  String get password => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_RegisterEntityCopyWith<_$_RegisterEntity> get copyWith =>
      throw _privateConstructorUsedError;
}
