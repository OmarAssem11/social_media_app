// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'utility_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$UtilityState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UtilityInitial value) initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(UtilityInitial value)? initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UtilityInitial value)? initial,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UtilityStateCopyWith<$Res> {
  factory $UtilityStateCopyWith(
          UtilityState value, $Res Function(UtilityState) then) =
      _$UtilityStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$UtilityStateCopyWithImpl<$Res> implements $UtilityStateCopyWith<$Res> {
  _$UtilityStateCopyWithImpl(this._value, this._then);

  final UtilityState _value;
  // ignore: unused_field
  final $Res Function(UtilityState) _then;
}

/// @nodoc
abstract class _$$UtilityInitialCopyWith<$Res> {
  factory _$$UtilityInitialCopyWith(
          _$UtilityInitial value, $Res Function(_$UtilityInitial) then) =
      __$$UtilityInitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$$UtilityInitialCopyWithImpl<$Res>
    extends _$UtilityStateCopyWithImpl<$Res>
    implements _$$UtilityInitialCopyWith<$Res> {
  __$$UtilityInitialCopyWithImpl(
      _$UtilityInitial _value, $Res Function(_$UtilityInitial) _then)
      : super(_value, (v) => _then(v as _$UtilityInitial));

  @override
  _$UtilityInitial get _value => super._value as _$UtilityInitial;
}

/// @nodoc

class _$UtilityInitial implements UtilityInitial {
  _$UtilityInitial();

  @override
  String toString() {
    return 'UtilityState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$UtilityInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UtilityInitial value) initial,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(UtilityInitial value)? initial,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UtilityInitial value)? initial,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class UtilityInitial implements UtilityState {
  factory UtilityInitial() = _$UtilityInitial;
}
