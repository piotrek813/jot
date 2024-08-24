// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chote.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ChoteImpl _$$ChoteImplFromJson(Map<String, dynamic> json) => _$ChoteImpl(
      text: json['text'] as String,
      createdDate: DateTime.parse(json['createdDate'] as String),
      id: (json['id'] as num?)?.toInt(),
      files:
          (json['files'] as List<dynamic>?)?.map((e) => e as String).toSet() ??
              const {},
    );

Map<String, dynamic> _$$ChoteImplToJson(_$ChoteImpl instance) =>
    <String, dynamic>{
      'text': instance.text,
      'createdDate': instance.createdDate.toIso8601String(),
      'id': instance.id,
      'files': instance.files.toList(),
    };
