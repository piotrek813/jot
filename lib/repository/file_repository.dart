import 'package:jot_notes/drift/database.dart';
import 'package:jot_notes/repository/model/file_dto.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'file_repository.g.dart';

class FileRepository {
  AppDatabase db;
  static const tableName = "File";

  FileRepository({required this.db});

  Future<Set<FileDto>> saveAll(Set<String> files, int choteId) async {
    // final filesDto = files.map((e) => FileDto(
    //       path: e,
    //       createdDate: DateTime.now().millisecondsSinceEpoch,
    //       choteId: choteId,
    //     ));
    //
    // final savedDtos = await db.transaction((txn) {
    //   return Future.wait(filesDto.map((dto) async {
    //     final id = await txn.insert(tableName, dto.toJson(),
    //         conflictAlgorithm: ConflictAlgorithm.replace);
    //
    //     return dto.copyWith(id: id);
    //   }));
    // });
    //
    // return savedDtos.toSet();
    return {};
  }

  Future<Set<FileDto>> getByChoteId(int choteId) async {
    // final res =
    //     await db.query(tableName, where: "choteId = ?", whereArgs: [choteId]);
    // return res.map(FileDto.fromJson).toSet();

    return {};
  }
}

@riverpod
FileRepository fileRepository(FileRepositoryRef ref) {
  final db = ref.watch(driftProvider);

  return FileRepository(db: db);
}
