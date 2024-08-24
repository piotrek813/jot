// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chote_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ChoteDto _$ChoteDtoFromJson(Map<String, dynamic> json) {
  return _ChoteDto.fromJson(json);
}

/// @nodoc
mixin _$ChoteDto {
  String get text => throw _privateConstructorUsedError;
  int get createdDate => throw _privateConstructorUsedError;
  int? get id => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChoteDtoCopyWith<ChoteDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChoteDtoCopyWith<$Res> {
  factory $ChoteDtoCopyWith(ChoteDto value, $Res Function(ChoteDto) then) =
      _$ChoteDtoCopyWithImpl<$Res, ChoteDto>;
  @useResult
  $Res call({String text, int createdDate, int? id});
}

/// @nodoc
class _$ChoteDtoCopyWithImpl<$Res, $Val extends ChoteDto>
    implements $ChoteDtoCopyWith<$Res> {
  _$ChoteDtoCopyWithImpl(this._value, this._then);

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
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ChoteDtoImplCopyWith<$Res>
    implements $ChoteDtoCopyWith<$Res> {
  factory _$$ChoteDtoImplCopyWith(
          _$ChoteDtoImpl value, $Res Function(_$ChoteDtoImpl) then) =
      __$$ChoteDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String text, int createdDate, int? id});
}

/// @nodoc
class __$$ChoteDtoImplCopyWithImpl<$Res>
    extends _$ChoteDtoCopyWithImpl<$Res, _$ChoteDtoImpl>
    implements _$$ChoteDtoImplCopyWith<$Res> {
  __$$ChoteDtoImplCopyWithImpl(
      _$ChoteDtoImpl _value, $Res Function(_$ChoteDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? text = null,
    Object? createdDate = null,
    Object? id = freezed,
  }) {
    return _then(_$ChoteDtoImpl(
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      createdDate: null == createdDate
          ? _value.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
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
class _$ChoteDtoImpl implements _ChoteDto {
  const _$ChoteDtoImpl(
      {required this.text, required this.createdDate, this.id});

  factory _$ChoteDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChoteDtoImplFromJson(json);

  @override
  final String text;
  @override
  final int createdDate;
  @override
  final int? id;

  @override
  String toString() {
    return 'ChoteDto(text: $text, createdDate: $createdDate, id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChoteDtoImpl &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.createdDate, createdDate) ||
                other.createdDate == createdDate) &&
            (identical(other.id, id) || other.id == id));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, text, createdDate, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChoteDtoImplCopyWith<_$ChoteDtoImpl> get copyWith =>
      __$$ChoteDtoImplCopyWithImpl<_$ChoteDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChoteDtoImplToJson(
      this,
    );
  }
}

abstract class _ChoteDto implements ChoteDto {
  const factory _ChoteDto(
      {required final String text,
      required final int createdDate,
      final int? id}) = _$ChoteDtoImpl;

  factory _ChoteDto.fromJson(Map<String, dynamic> json) =
      _$ChoteDtoImpl.fromJson;

  @override
  String get text;
  @override
  int get createdDate;
  @override
  int? get id;
  @override
  @JsonKey(ignore: true)
  _$$ChoteDtoImplCopyWith<_$ChoteDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
