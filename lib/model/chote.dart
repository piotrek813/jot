import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'chote.freezed.dart';
part 'chote.g.dart';

@freezed
class Chote with _$Chote {
  const Chote._();
  const factory Chote(
      {required String text,
      DateTime? createdDate,
      String? id,
      String? ownerId,
      Set<String>? files}) = _Chote;

  factory Chote.fromJson(Map<String, Object?> json) => _$ChoteFromJson(json);

  Map<String, dynamic> toFirestore() => toJson();

  factory Chote.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    data!["id"] = snapshot.id;
    return Chote.fromJson(data);
  }

  String get createdTime {
    final local = createdDate?.toLocal();
    if (local == null) return "";
    return "${local.hour}:${local.minute}";
  }
}
