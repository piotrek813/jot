import 'package:drift/drift.dart';
import 'package:jot_notes/drift/database.dart';
import 'package:jot_notes/model/chote.dart';

part 'chote_dao.g.dart';

@DriftAccessor(tables: [ChoteItems, ChoteTag, TagItems])
class ChoteDao extends DatabaseAccessor<AppDatabase> with _$ChoteDaoMixin {
  ChoteDao(super.db);

  Future<int> save(Chote chote) async {
    return transaction(() async {
      final choteId = await into(choteItems).insert(
          ChoteItemsCompanion(
              id: Value.absentIfNull(chote.id),
              content: Value(chote.text),
              createdAt: Value.absentIfNull(chote.createdDate),
              files: Value(chote.files)),
          mode: InsertMode.replace);

      for (final tag in chote.tags) {
        int tagId;
        try {
          tagId =
              await into(tagItems).insert(TagItemsCompanion(name: Value(tag)));
        } catch (_) {
          final found = await (select(tagItems)
                ..where((u) => u.name.equals(tag)))
              .getSingle();
          tagId = found.id;
        }
        await into(choteTag).insert(
            ChoteTagCompanion(choteId: Value(choteId), tagId: Value(tagId)));
      }

      return choteId;
    });
  }

  Stream<List<Chote>> watch({List<String> tags = const []}) async* {
    if (tags.isNotEmpty) {
      final query = select(choteItems).join([
        innerJoin(choteTag, choteTag.choteId.equalsExp(choteItems.id)),
        innerJoin(tagItems, choteTag.tagId.equalsExp(tagItems.id)),
      ])
        ..where(tagItems.name.isIn(tags))
        ..orderBy([OrderingTerm.desc(choteItems.createdAt)]);

      yield* query
          .watch()
          .map((items) => items.map((item) => item.readTable(choteItems)))
          .map((items) => items
              .map((item) => Chote(
                  text: item.content, id: item.id, createdDate: item.createdAt, files: item.files))
              .toList());
    }

    final query = select(choteItems)
      ..orderBy([(t) => OrderingTerm.desc(t.createdAt)]);

    yield* query.watch().map((items) => items
        .map((item) =>
            Chote(text: item.content, id: item.id, createdDate: item.createdAt, files: item.files))
        .toList());
  }
}
