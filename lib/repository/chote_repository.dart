import 'package:jot_notes/migrations/database.dart';
import 'package:jot_notes/model/chote.dart';
import 'package:jot_notes/repository/file_repository.dart';
import 'package:jot_notes/repository/model/chote_dto.dart';
import 'package:jot_notes/repository/model/file_dto.dart';
import 'package:jot_notes/repository/tag_repository.dart';
import 'package:jot_notes/repository/utils.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sqflite/sqflite.dart';

part 'chote_repository.g.dart';

class ChoteRepository {
  Database db;
  FileRepository fileRepository;
  TagRepository tagRepository;
  static const tableName = "Chote";

  ChoteRepository(
      {required this.db,
      required this.fileRepository,
      required this.tagRepository});

  Chote fromDto(ChoteDto dto, [Set<FileDto> fileDtos = const {}]) {
    return Chote(
        id: dto.id,
        text: dto.text,
        files: fileDtos.map((e) => e.path).toSet(),
        createdDate: DateTime.fromMillisecondsSinceEpoch(dto.createdDate));
  }

  Future<Chote> save(Chote chote) async {
    final choteDto = ChoteDto(
        id: chote.id,
        text: chote.text,
        createdDate: chote.createdDate.millisecondsSinceEpoch);

    final id = await db.insert(tableName, choteDto.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace);

    final files = await fileRepository.saveAll(chote.files, id);
    tagRepository.saveAll(chote.tags, id);

    return fromDto(choteDto.copyWith(id: id), files);
  }

  Future<void> delete(int id) async {
    db.delete(tableName, where: 'id = ?', whereArgs: [id]);
  }

  Future<void> deleteAll(List<int> ids) async {
    await db.delete(tableName,
        where: 'id IN (${getQuestionMarks(ids)})', whereArgs: ids);
  }

  Future<List<Chote>> get(int offset) async {
    final res = await db.query(tableName,
        orderBy: "createdDate DESC", limit: 50, offset: offset);

    final r = Future.wait(res
        .map(ChoteDto.fromJson)
        .map(
            (e) async => fromDto(e, (await fileRepository.getByChoteId(e.id!))))
        .toList());

    return r;
  }

  Future<List<Chote>> query(String query) async {
    final res = await db.query(tableName,
        where: "text LIKE ?",
        whereArgs: ["%$query%"],
        orderBy: "createdDate DESC",
        limit: 50);

    return res.map(ChoteDto.fromJson).map(fromDto).toList();
  }
}

@riverpod
ChoteRepository choteRepository(ChoteRepositoryRef ref) {
  final db = ref.watch(databaseProvider);
  final fileRepository = ref.watch(fileRepositoryProvider);
  final tagRepository = ref.watch(tagRepositoryProvider);

  return ChoteRepository(
      db: db, fileRepository: fileRepository, tagRepository: tagRepository);
}
