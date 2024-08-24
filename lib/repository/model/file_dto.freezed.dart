// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'file_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

FileDto _$FileDtoFromJson(Map<String, dynamic> json) {
  return _FileDto.fromJson(json);
}

/// @nodoc
mixin _$FileDto {
  String get text => throw _privateConstructorUsedError;
  int get createdDate => throw _privateConstructorUsedError;
  int get choteId => throw _privateConstructorUsedError;
  int? get id => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FileDtoCopyWith<FileDto> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FileDtoCopyWith<$Res> {
  factory $FileDtoCopyWith(FileDto value, $Res Function(FileDto) then) =
      _$FileDtoCopyWithImpl<$Res, FileDto>;
  @useResult
  $Res call({String text, int createdDate, int choteId, int? id});
}

/// @nodoc
class _$FileDtoCopyWithImpl<$Res, $Val extends FileDto>
    implements $FileDtoCopyWith<$Res> {
  _$FileDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? text = null,
    Object? createdDate = null,
    Object? choteId = null,
    Object? id = freezed,
  }) {
    return _then(_value.copyWith(
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      createdDate: null == createdDate
          ? _value.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as int,
      choteId: null == choteId
          ? _value.choteId
          : choteId // ignore: cast_nullable_to_non_nullable
              as int,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FileDtoImplCopyWith<$Res> implements $FileDtoCopyWith<$Res> {
  factory _$$FileDtoImplCopyWith(
          _$FileDtoImpl value, $Res Function(_$FileDtoImpl) then) =
      __$$FileDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String text, int createdDate, int choteId, int? id});
}

/// @nodoc
class __$$FileDtoImplCopyWithImpl<$Res>
    extends _$FileDtoCopyWithImpl<$Res, _$FileDtoImpl>
    implements _$$FileDtoImplCopyWith<$Res> {
  __$$FileDtoImplCopyWithImpl(
      _$FileDtoImpl _value, $Res Function(_$FileDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? text = null,
    Object? createdDate = null,
    Object? choteId = null,
    Object? id = freezed,
  }) {
    return _then(_$FileDtoImpl(
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      createdDate: null == createdDate
          ? _value.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as int,
      choteId: null == choteId
          ? _value.choteId
          : choteId // ignore: cast_nullable_to_non_nullable
              as int,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FileDtoImpl implements _FileDto {
  const _$FileDtoImpl(
      {required this.text,
      required this.createdDate,
      required this.choteId,
      this.id});

  factory _$FileDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$FileDtoImplFromJson(json);

  @override
  final String text;
  @override
  final int createdDate;
  @override
  final int choteId;
  @override
  final int? id;

  @override
  String toString() {
    return 'FileDto(text: $text, createdDate: $createdDate, choteId: $choteId, id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FileDtoImpl &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.createdDate, createdDate) ||
                other.createdDate == createdDate) &&
            (identical(other.choteId, choteId) || other.choteId == choteId) &&
            (identical(other.id, id) || other.id == id));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, text, createdDate, choteId, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FileDtoImplCopyWith<_$FileDtoImpl> get copyWith =>
      __$$FileDtoImplCopyWithImpl<_$FileDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FileDtoImplToJson(
      this,
    );
  }
}

abstract class _FileDto implements FileDto {
  const factory _FileDto(
      {required final String text,
      required final int createdDate,
      required final int choteId,
      final int? id}) = _$FileDtoImpl;

  factory _FileDto.fromJson(Map<String, dynamic> json) = _$FileDtoImpl.fromJson;

  @override
  String get text;
  @override
  int get createdDate;
  @override
  int get choteId;
  @override
  int? get id;
  @override
  @JsonKey(ignore: true)
  _$$FileDtoImplCopyWith<_$FileDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
