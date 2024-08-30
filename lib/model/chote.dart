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
    final minute = local.minute < 10 ? "0${local.minute}" : "${local.minute}";
    return "${local.hour}:$minute";
  }

  Set<String> get tags {
    return RegExp(r'(#\S+)')
        .allMatches(text)
        .map((e) => e[0])
        .whereType<String>()
        .toSet();
  }
}
