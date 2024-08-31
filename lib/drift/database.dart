import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:jot_notes/drift/daos/chote_dao.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'database.g.dart';

class ChoteItems extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get content => text()();
  DateTimeColumn get createdAt => dateTime()();
}

class ChoteTag extends Table {
  IntColumn get choteId => integer().references(ChoteItems, #id)();
  IntColumn get tagId => integer().references(TagItems, #id)();
}

class TagItems extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().unique()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDate)();
}

@DriftDatabase(tables: [ChoteItems, TagItems, ChoteTag], daos: [ChoteDao])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  static QueryExecutor _openConnection() {
    return driftDatabase(name: 'main');
  }

}

@riverpod
AppDatabase drift(DriftRef ref) {
  throw UnimplementedError();
}
