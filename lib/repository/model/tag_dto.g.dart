// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tag_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TagDtoImpl _$$TagDtoImplFromJson(Map<String, dynamic> json) => _$TagDtoImpl(
      name: json['name'] as String,
      createdDate: (json['createdDate'] as num).toInt(),
      id: (json['id'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$TagDtoImplToJson(_$TagDtoImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'createdDate': instance.createdDate,
      'id': instance.id,
    };
