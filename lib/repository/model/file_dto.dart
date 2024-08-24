import 'package:freezed_annotation/freezed_annotation.dart';

part 'file_dto.freezed.dart';
part 'file_dto.g.dart';

@freezed
class FileDto with _$FileDto {
  const factory FileDto(
      {required String text,
      required int createdDate,
      required int choteId,
      int? id}) = _FileDto;

    factory FileDto.fromJson(Map<String, Object?> json) => _$FileDtoFromJson(json);
}
