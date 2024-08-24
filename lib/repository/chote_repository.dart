import 'package:jot_notes/migrations/database.dart';
import 'package:jot_notes/model/chote.dart';
import 'package:jot_notes/repository/model/chote_dto.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sqflite/sqflite.dart';

part 'chote_repository.g.dart';

String getQuestionMarks(List list) {
  return List.filled(list.length, "?").join(",");
}

class ChoteRepository {
  Database db;
  final tableName = "Chote";

  ChoteRepository({required this.db});

  Future<ChoteDto> save(Chote chote) async {
    final choteDto = ChoteDto(id: chote.id, text: chote.text, createdDate: chote.createdDate.millisecondsSinceEpoch);
    // final Set<FileDto> files;
  
    // if (chote.files != null) {
    //   files = chote.files.map((file) => FileDto(path: file, createdDate: createdDate, choteId: chote.id));
    // }

    final id = await db.insert(tableName, choteDto.toJson(), conflictAlgorithm: ConflictAlgorithm.replace);
    return choteDto.copyWith(id: id);
  }

  Future<void> delete(int id) async {
    db.delete(tableName, where: 'id = ?', whereArgs: [id]);
  }

  Future<void> deleteAll(List<int> ids) async {
   await db.delete(tableName,
    where: 'id IN (${getQuestionMarks(ids)})',
    whereArgs: ids);
  }

  Future<List<ChoteDto>> get(int offset) async {
    final res = await db.query(tableName, orderBy: "createdDate DESC",limit: 50, offset: offset);

    return res.map(ChoteDto.fromJson).toList();
  }

  Future<List<ChoteDto>> query(String query ) async {
    final res = await db.query(tableName, where: "text LIKE ?", whereArgs: ["%$query%"], orderBy: "createdDate DESC", limit: 50);

    return res.map(ChoteDto.fromJson).toList();
  }
}

@riverpod
ChoteRepository choteRepository(ChoteRepositoryRef ref) {
  final db = ref.watch(databaseProvider);

  return ChoteRepository(db: db);
}

