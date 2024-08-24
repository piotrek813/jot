import 'package:freezed_annotation/freezed_annotation.dart';

part 'chote.freezed.dart';
part 'chote.g.dart';

@freezed
class Chote with _$Chote {
  const Chote._();
  const factory Chote(
      {required String text,
      required DateTime createdDate,
      int? id,
      @Default({}) Set<String> files}) = _Chote;

  factory Chote.fromJson(Map<String, Object?> json) => _$ChoteFromJson(json);

  String get createdTime {
    final local = createdDate.toLocal();
    return "${local.hour}:${local.minute}";
  }
}
