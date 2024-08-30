import 'package:jot_notes/migrations/database.dart';
import 'package:jot_notes/repository/model/file_dto.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sqflite/sqflite.dart';

part 'file_repository.g.dart';

class FileRepository {
  Database db;
  static const tableName = "File";

  FileRepository({required this.db});

  Future<Set<FileDto>> saveAll(Set<String> files, int choteId) async {
    final filesDto = files.map((e) => FileDto(
          path: e,
          createdDate: DateTime.now().millisecondsSinceEpoch,
          choteId: choteId,
        ));

    final savedDtos = await db.transaction((txn) {
      return Future.wait(filesDto.map((dto) async {
        final id = await txn.insert(tableName, dto.toJson(),
            conflictAlgorithm: ConflictAlgorithm.replace);

        return dto.copyWith(id: id);
      }));
    });

    return savedDtos.toSet();
  }

  Future<Set<FileDto>> getByChoteId(int choteId) async {
    final res =
        await db.query(tableName, where: "choteId = ?", whereArgs: [choteId]);
    return res.map(FileDto.fromJson).toSet();
  }
}

@riverpod
FileRepository fileRepository(FileRepositoryRef ref) {
  final db = ref.watch(databaseProvider);

  return FileRepository(db: db);
}
