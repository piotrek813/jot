// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'file_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FileDtoImpl _$$FileDtoImplFromJson(Map<String, dynamic> json) =>
    _$FileDtoImpl(
      text: json['text'] as String,
      createdDate: (json['createdDate'] as num).toInt(),
      choteId: (json['choteId'] as num).toInt(),
      id: (json['id'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$FileDtoImplToJson(_$FileDtoImpl instance) =>
    <String, dynamic>{
      'text': instance.text,
      'createdDate': instance.createdDate,
      'choteId': instance.choteId,
      'id': instance.id,
    };
