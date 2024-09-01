import 'package:jot_notes/drift/database.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'tag_repository.g.dart';

class TagRepository {
  AppDatabase db;
  static const tableName = "Tag";
  static const tableChoteTag = "ChoteTag";

  TagRepository({required this.db});

  Stream<List<String>> watch() async* {
    yield* db.managers.tagItems
        .watch()
        .map((items) => items.map((e) => e.name).toList());
  }
}

@riverpod
TagRepository tagRepository(TagRepositoryRef ref) {
  final db = ref.watch(driftProvider);

  return TagRepository(db: db);
}
