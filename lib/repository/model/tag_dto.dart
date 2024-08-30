import 'package:freezed_annotation/freezed_annotation.dart';

part 'tag_dto.freezed.dart';
part 'tag_dto.g.dart';

@freezed
class TagDto with _$TagDto {
  const factory TagDto(
      {required String name,
      required int createdDate,
      int? id}) = _TagDto;

    factory TagDto.fromJson(Map<String, Object?> json) => _$TagDtoFromJson(json);
}
