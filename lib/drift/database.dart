import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:flutter/foundation.dart';
import 'package:jot_notes/drift/converters/list_converter.dart';
import 'package:jot_notes/drift/daos/chote_dao.dart';
import 'package:jot_notes/drift/schema_versions.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'database.g.dart';

class ChoteItems extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get content => text()();
  DateTimeColumn get createdAt => dateTime()();
  TextColumn get files => text().map(const DatabaseSetConverter())();
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

class LinkPreviewItems extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text()();
  TextColumn get description => text()();
  TextColumn get image => text()();
  TextColumn get url => text()();
}

@DriftDatabase(
    tables: [ChoteItems, TagItems, ChoteTag, LinkPreviewItems],
    daos: [ChoteDao])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 2;

  static QueryExecutor _openConnection() {
    return driftDatabase(name: 'main');
  }

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      onCreate: (Migrator m) async {
        await m.createAll();
      },
      onUpgrade: (m, from, to) async {
        // Run migration steps without foreign keys and re-enable them later
        // (https://drift.simonbinder.eu/docs/advanced-features/migrations/#tips)
        await customStatement('PRAGMA foreign_keys = OFF');

        await m.runMigrationSteps(
          from: from,
          to: to,
          steps: migrationSteps(
            from1To2: (m, schema) async {
              await m.createTable(schema.linkPreviewItems);
            },
          ),
        );

        if (kDebugMode) {
          // Fail if the migration broke foreign keys
          final wrongForeignKeys =
              await customSelect('PRAGMA foreign_key_check').get();
          assert(wrongForeignKeys.isEmpty,
              '${wrongForeignKeys.map((e) => e.data)}');
        }

        await customStatement('PRAGMA foreign_keys = ON;');
      },
    );
  }
}

@riverpod
AppDatabase drift(DriftRef ref) {
  throw UnimplementedError();
}
