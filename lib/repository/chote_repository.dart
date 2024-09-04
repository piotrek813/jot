import 'package:drift/drift.dart';
import 'package:jot_notes/drift/daos/chote_dao.dart';
import 'package:jot_notes/drift/database.dart';
import 'package:jot_notes/model/chote.dart';
import 'package:jot_notes/repository/tag_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'chote_repository.g.dart';

class ChoteRepository {
  AppDatabase db;
  TagRepository tagRepository;
  ChoteDao choteDao;

  static const offset = 50;
  static const tableName = "Chote";

  ChoteRepository(
      {required this.db,
      
      required this.tagRepository})
      : choteDao = ChoteDao(db);

  Future<Chote> save(Chote chote) async {
    final id = await choteDao.save(chote);

    return chote.copyWith(id: id);
  }

  Future<void> delete(int id) async {
    db.managers.choteItems.filter((f) => f.id(id)).delete();
  }

  Future<void> deleteAll(List<int> ids) async {
    db.managers.choteItems.filter((f) => f.id.isIn(ids)).delete();
  }

  Stream<List<Chote>> watch({List<String> tags = const []}) async* {
    yield* choteDao.watch(tags: tags);
  }

  Future<List<Chote>> query(String query) async {
    final res = await db.managers.choteItems
        .filter((f) => f.content.contains(query))
        .get();

    return res
        .map((e) => Chote(text: e.content, createdDate: e.createdAt, id: e.id))
        .toList();
  }
}

@riverpod
ChoteRepository choteRepository(ChoteRepositoryRef ref) {
  final db = ref.watch(driftProvider);
  final tagRepository = ref.watch(tagRepositoryProvider);

  return ChoteRepository(
      db: db, tagRepository: tagRepository);
}
