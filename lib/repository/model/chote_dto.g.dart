// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chote_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ChoteDtoImpl _$$ChoteDtoImplFromJson(Map<String, dynamic> json) =>
    _$ChoteDtoImpl(
      text: json['text'] as String,
      createdDate: (json['createdDate'] as num?)?.toInt(),
      id: (json['id'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$ChoteDtoImplToJson(_$ChoteDtoImpl instance) =>
    <String, dynamic>{
      'text': instance.text,
      'createdDate': instance.createdDate,
      'id': instance.id,
    };
