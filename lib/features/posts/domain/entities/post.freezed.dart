// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'post.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Post {
  String get id => throw _privateConstructorUsedError;
  String get text => throw _privateConstructorUsedError;
  String? get imageUrl => throw _privateConstructorUsedError;
  DateTime get dateTime => throw _privateConstructorUsedError;
  String get publisherName => throw _privateConstructorUsedError;
  String get publisherImage => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PostCopyWith<Post> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PostCopyWith<$Res> {
  factory $PostCopyWith(Post value, $Res Function(Post) then) =
      _$PostCopyWithImpl<$Res>;
  $Res call(
      {String id,
      String text,
      String? imageUrl,
      DateTime dateTime,
      String publisherName,
      String publisherImage});
}

/// @nodoc
class _$PostCopyWithImpl<$Res> implements $PostCopyWith<$Res> {
  _$PostCopyWithImpl(this._value, this._then);

  final Post _value;
  // ignore: unused_field
  final $Res Function(Post) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? text = freezed,
    Object? imageUrl = freezed,
    Object? dateTime = freezed,
    Object? publisherName = freezed,
    Object? publisherImage = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      text: text == freezed
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: imageUrl == freezed
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      dateTime: dateTime == freezed
          ? _value.dateTime
          : dateTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      publisherName: publisherName == freezed
          ? _value.publisherName
          : publisherName // ignore: cast_nullable_to_non_nullable
              as String,
      publisherImage: publisherImage == freezed
          ? _value.publisherImage
          : publisherImage // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_PostCopyWith<$Res> implements $PostCopyWith<$Res> {
  factory _$$_PostCopyWith(_$_Post value, $Res Function(_$_Post) then) =
      __$$_PostCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id,
      String text,
      String? imageUrl,
      DateTime dateTime,
      String publisherName,
      String publisherImage});
}

/// @nodoc
class __$$_PostCopyWithImpl<$Res> extends _$PostCopyWithImpl<$Res>
    implements _$$_PostCopyWith<$Res> {
  __$$_PostCopyWithImpl(_$_Post _value, $Res Function(_$_Post) _then)
      : super(_value, (v) => _then(v as _$_Post));

  @override
  _$_Post get _value => super._value as _$_Post;

  @override
  $Res call({
    Object? id = freezed,
    Object? text = freezed,
    Object? imageUrl = freezed,
    Object? dateTime = freezed,
    Object? publisherName = freezed,
    Object? publisherImage = freezed,
  }) {
    return _then(_$_Post(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      text: text == freezed
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: imageUrl == freezed
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      dateTime: dateTime == freezed
          ? _value.dateTime
          : dateTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      publisherName: publisherName == freezed
          ? _value.publisherName
          : publisherName // ignore: cast_nullable_to_non_nullable
              as String,
      publisherImage: publisherImage == freezed
          ? _value.publisherImage
          : publisherImage // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_Post implements _Post {
  const _$_Post(
      {this.id = '',
      required this.text,
      this.imageUrl,
      required this.dateTime,
      required this.publisherName,
      required this.publisherImage});

  @override
  @JsonKey()
  final String id;
  @override
  final String text;
  @override
  final String? imageUrl;
  @override
  final DateTime dateTime;
  @override
  final String publisherName;
  @override
  final String publisherImage;

  @override
  String toString() {
    return 'Post(id: $id, text: $text, imageUrl: $imageUrl, dateTime: $dateTime, publisherName: $publisherName, publisherImage: $publisherImage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Post &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.text, text) &&
            const DeepCollectionEquality().equals(other.imageUrl, imageUrl) &&
            const DeepCollectionEquality().equals(other.dateTime, dateTime) &&
            const DeepCollectionEquality()
                .equals(other.publisherName, publisherName) &&
            const DeepCollectionEquality()
                .equals(other.publisherImage, publisherImage));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(text),
      const DeepCollectionEquality().hash(imageUrl),
      const DeepCollectionEquality().hash(dateTime),
      const DeepCollectionEquality().hash(publisherName),
      const DeepCollectionEquality().hash(publisherImage));

  @JsonKey(ignore: true)
  @override
  _$$_PostCopyWith<_$_Post> get copyWith =>
      __$$_PostCopyWithImpl<_$_Post>(this, _$identity);
}

abstract class _Post implements Post {
  const factory _Post(
      {final String id,
      required final String text,
      final String? imageUrl,
      required final DateTime dateTime,
      required final String publisherName,
      required final String publisherImage}) = _$_Post;

  @override
  String get id;
  @override
  String get text;
  @override
  String? get imageUrl;
  @override
  DateTime get dateTime;
  @override
  String get publisherName;
  @override
  String get publisherImage;
  @override
  @JsonKey(ignore: true)
  _$$_PostCopyWith<_$_Post> get copyWith => throw _privateConstructorUsedError;
}
