// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chote.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Chote _$ChoteFromJson(Map<String, dynamic> json) {
  return _Chote.fromJson(json);
}

/// @nodoc
mixin _$Chote {
  String get text => throw _privateConstructorUsedError;
  DateTime get createdDate => throw _privateConstructorUsedError;
  int? get id => throw _privateConstructorUsedError;
  Set<String> get files => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChoteCopyWith<Chote> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChoteCopyWith<$Res> {
  factory $ChoteCopyWith(Chote value, $Res Function(Chote) then) =
      _$ChoteCopyWithImpl<$Res, Chote>;
  @useResult
  $Res call({String text, DateTime createdDate, int? id, Set<String> files});
}

/// @nodoc
class _$ChoteCopyWithImpl<$Res, $Val extends Chote>
    implements $ChoteCopyWith<$Res> {
  _$ChoteCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? text = null,
    Object? createdDate = null,
    Object? id = freezed,
    Object? files = null,
  }) {
    return _then(_value.copyWith(
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      createdDate: null == createdDate
          ? _value.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      files: null == files
          ? _value.files
          : files // ignore: cast_nullable_to_non_nullable
              as Set<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ChoteImplCopyWith<$Res> implements $ChoteCopyWith<$Res> {
  factory _$$ChoteImplCopyWith(
          _$ChoteImpl value, $Res Function(_$ChoteImpl) then) =
      __$$ChoteImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String text, DateTime createdDate, int? id, Set<String> files});
}

/// @nodoc
class __$$ChoteImplCopyWithImpl<$Res>
    extends _$ChoteCopyWithImpl<$Res, _$ChoteImpl>
    implements _$$ChoteImplCopyWith<$Res> {
  __$$ChoteImplCopyWithImpl(
      _$ChoteImpl _value, $Res Function(_$ChoteImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? text = null,
    Object? createdDate = null,
    Object? id = freezed,
    Object? files = null,
  }) {
    return _then(_$ChoteImpl(
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      createdDate: null == createdDate
          ? _value.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      files: null == files
          ? _value._files
          : files // ignore: cast_nullable_to_non_nullable
              as Set<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ChoteImpl extends _Chote {
  const _$ChoteImpl(
      {required this.text,
      required this.createdDate,
      this.id,
      final Set<String> files = const {}})
      : _files = files,
        super._();

  factory _$ChoteImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChoteImplFromJson(json);

  @override
  final String text;
  @override
  final DateTime createdDate;
  @override
  final int? id;
  final Set<String> _files;
  @override
  @JsonKey()
  Set<String> get files {
    if (_files is EqualUnmodifiableSetView) return _files;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableSetView(_files);
  }

  @override
  String toString() {
    return 'Chote(text: $text, createdDate: $createdDate, id: $id, files: $files)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChoteImpl &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.createdDate, createdDate) ||
                other.createdDate == createdDate) &&
            (identical(other.id, id) || other.id == id) &&
            const DeepCollectionEquality().equals(other._files, _files));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, text, createdDate, id,
      const DeepCollectionEquality().hash(_files));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChoteImplCopyWith<_$ChoteImpl> get copyWith =>
      __$$ChoteImplCopyWithImpl<_$ChoteImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChoteImplToJson(
      this,
    );
  }
}

abstract class _Chote extends Chote {
  const factory _Chote(
      {required final String text,
      required final DateTime createdDate,
      final int? id,
      final Set<String> files}) = _$ChoteImpl;
  const _Chote._() : super._();

  factory _Chote.fromJson(Map<String, dynamic> json) = _$ChoteImpl.fromJson;

  @override
  String get text;
  @override
  DateTime get createdDate;
  @override
  int? get id;
  @override
  Set<String> get files;
  @override
  @JsonKey(ignore: true)
  _$$ChoteImplCopyWith<_$ChoteImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
