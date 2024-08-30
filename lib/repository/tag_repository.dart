import 'package:jot_notes/migrations/database.dart';
import 'package:jot_notes/repository/model/tag_dto.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sqflite/sqflite.dart';

part 'tag_repository.g.dart';

class TagRepository {
  Database db;
  static const tableName = "Tag";
  static const tableChoteTag = "ChoteTag";

  TagRepository({required this.db});

  String fromDto(TagDto dto) {
    return dto.name;
  }

  Future<Set<String>> saveAll(Set<String> tags, int choteId) async {
    final tagDtos = tags.map((e) => TagDto(
          name: e,
          createdDate: DateTime.now().millisecondsSinceEpoch,
        ));


    final savedDtos = await db.transaction((txn) async {
      return Future.wait(tagDtos.map((dto) async {
        final id = await txn.insert(tableName, dto.toJson(),
           conflictAlgorithm: ConflictAlgorithm.ignore);

        txn.insert(tableChoteTag, {
          "choteId": choteId,
          "tagId": id
        });
  
        return dto = dto.copyWith(id: id);
      }));
    });
  

    return savedDtos.map(fromDto).toSet();
  }

  Future<Set<String>> getAll() async {
    final res = await db.query(tableName);

    return res.map(TagDto.fromJson).map(fromDto).toSet();
  }
}

@riverpod
TagRepository tagRepository(TagRepositoryRef ref) {
  final db = ref.watch(databaseProvider);

  return TagRepository(db: db);
}
