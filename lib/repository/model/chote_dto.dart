import 'package:freezed_annotation/freezed_annotation.dart';

part 'chote_dto.freezed.dart';
part 'chote_dto.g.dart';

@freezed
class ChoteDto with _$ChoteDto {
  const factory ChoteDto(
      {required String text,
      required int createdDate,
      int? id,
      }) = _ChoteDto;

  factory ChoteDto.fromJson(Map<String, Object?> json) => _$ChoteDtoFromJson(json);

}
