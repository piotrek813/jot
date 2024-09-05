import 'package:drift/internal/versioned_schema.dart' as i0;
import 'package:drift/drift.dart' as i1;
import 'package:drift/drift.dart'; // ignore_for_file: type=lint,unused_import

// GENERATED BY drift_dev, DO NOT MODIFY.
final class Schema2 extends i0.VersionedSchema {
  Schema2({required super.database}) : super(version: 2);
  @override
  late final List<i1.DatabaseSchemaEntity> entities = [
    choteItems,
    tagItems,
    choteTag,
    linkPreviewItems,
  ];
  late final Shape0 choteItems = Shape0(
      source: i0.VersionedTable(
        entityName: 'chote_items',
        withoutRowId: false,
        isStrict: false,
        tableConstraints: [],
        columns: [
          _column_0,
          _column_1,
          _column_2,
          _column_3,
        ],
        attachedDatabase: database,
      ),
      alias: null);
  late final Shape1 tagItems = Shape1(
      source: i0.VersionedTable(
        entityName: 'tag_items',
        withoutRowId: false,
        isStrict: false,
        tableConstraints: [],
        columns: [
          _column_0,
          _column_4,
          _column_5,
        ],
        attachedDatabase: database,
      ),
      alias: null);
  late final Shape2 choteTag = Shape2(
      source: i0.VersionedTable(
        entityName: 'chote_tag',
        withoutRowId: false,
        isStrict: false,
        tableConstraints: [],
        columns: [
          _column_6,
          _column_7,
        ],
        attachedDatabase: database,
      ),
      alias: null);
  late final Shape3 linkPreviewItems = Shape3(
      source: i0.VersionedTable(
        entityName: 'link_preview_items',
        withoutRowId: false,
        isStrict: false,
        tableConstraints: [],
        columns: [
          _column_0,
          _column_8,
          _column_9,
          _column_10,
          _column_11,
        ],
        attachedDatabase: database,
      ),
      alias: null);
}

class Shape0 extends i0.VersionedTable {
  Shape0({required super.source, required super.alias}) : super.aliased();
  i1.GeneratedColumn<int> get id =>
      columnsByName['id']! as i1.GeneratedColumn<int>;
  i1.GeneratedColumn<String> get content =>
      columnsByName['content']! as i1.GeneratedColumn<String>;
  i1.GeneratedColumn<DateTime> get createdAt =>
      columnsByName['created_at']! as i1.GeneratedColumn<DateTime>;
  i1.GeneratedColumn<String> get files =>
      columnsByName['files']! as i1.GeneratedColumn<String>;
}

i1.GeneratedColumn<int> _column_0(String aliasedName) =>
    i1.GeneratedColumn<int>('id', aliasedName, false,
        hasAutoIncrement: true,
        type: i1.DriftSqlType.int,
        defaultConstraints:
            i1.GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
i1.GeneratedColumn<String> _column_1(String aliasedName) =>
    i1.GeneratedColumn<String>('content', aliasedName, false,
        type: i1.DriftSqlType.string);
i1.GeneratedColumn<DateTime> _column_2(String aliasedName) =>
    i1.GeneratedColumn<DateTime>('created_at', aliasedName, false,
        type: i1.DriftSqlType.dateTime);
i1.GeneratedColumn<String> _column_3(String aliasedName) =>
    i1.GeneratedColumn<String>('files', aliasedName, false,
        type: i1.DriftSqlType.string);

class Shape1 extends i0.VersionedTable {
  Shape1({required super.source, required super.alias}) : super.aliased();
  i1.GeneratedColumn<int> get id =>
      columnsByName['id']! as i1.GeneratedColumn<int>;
  i1.GeneratedColumn<String> get name =>
      columnsByName['name']! as i1.GeneratedColumn<String>;
  i1.GeneratedColumn<DateTime> get createdAt =>
      columnsByName['created_at']! as i1.GeneratedColumn<DateTime>;
}

i1.GeneratedColumn<String> _column_4(String aliasedName) =>
    i1.GeneratedColumn<String>('name', aliasedName, false,
        type: i1.DriftSqlType.string,
        defaultConstraints: i1.GeneratedColumn.constraintIsAlways('UNIQUE'));
i1.GeneratedColumn<DateTime> _column_5(String aliasedName) =>
    i1.GeneratedColumn<DateTime>('created_at', aliasedName, false,
        type: i1.DriftSqlType.dateTime, defaultValue: currentDate);

class Shape2 extends i0.VersionedTable {
  Shape2({required super.source, required super.alias}) : super.aliased();
  i1.GeneratedColumn<int> get choteId =>
      columnsByName['chote_id']! as i1.GeneratedColumn<int>;
  i1.GeneratedColumn<int> get tagId =>
      columnsByName['tag_id']! as i1.GeneratedColumn<int>;
}

i1.GeneratedColumn<int> _column_6(String aliasedName) =>
    i1.GeneratedColumn<int>('chote_id', aliasedName, false,
        type: i1.DriftSqlType.int,
        defaultConstraints: i1.GeneratedColumn.constraintIsAlways(
            'REFERENCES chote_items (id)'));
i1.GeneratedColumn<int> _column_7(String aliasedName) =>
    i1.GeneratedColumn<int>('tag_id', aliasedName, false,
        type: i1.DriftSqlType.int,
        defaultConstraints:
            i1.GeneratedColumn.constraintIsAlways('REFERENCES tag_items (id)'));

class Shape3 extends i0.VersionedTable {
  Shape3({required super.source, required super.alias}) : super.aliased();
  i1.GeneratedColumn<int> get id =>
      columnsByName['id']! as i1.GeneratedColumn<int>;
  i1.GeneratedColumn<String> get title =>
      columnsByName['title']! as i1.GeneratedColumn<String>;
  i1.GeneratedColumn<String> get description =>
      columnsByName['description']! as i1.GeneratedColumn<String>;
  i1.GeneratedColumn<String> get image =>
      columnsByName['image']! as i1.GeneratedColumn<String>;
  i1.GeneratedColumn<String> get url =>
      columnsByName['url']! as i1.GeneratedColumn<String>;
}

i1.GeneratedColumn<String> _column_8(String aliasedName) =>
    i1.GeneratedColumn<String>('title', aliasedName, false,
        type: i1.DriftSqlType.string);
i1.GeneratedColumn<String> _column_9(String aliasedName) =>
    i1.GeneratedColumn<String>('description', aliasedName, false,
        type: i1.DriftSqlType.string);
i1.GeneratedColumn<String> _column_10(String aliasedName) =>
    i1.GeneratedColumn<String>('image', aliasedName, false,
        type: i1.DriftSqlType.string);
i1.GeneratedColumn<String> _column_11(String aliasedName) =>
    i1.GeneratedColumn<String>('url', aliasedName, false,
        type: i1.DriftSqlType.string);
i0.MigrationStepWithVersion migrationSteps({
  required Future<void> Function(i1.Migrator m, Schema2 schema) from1To2,
}) {
  return (currentVersion, database) async {
    switch (currentVersion) {
      case 1:
        final schema = Schema2(database: database);
        final migrator = i1.Migrator(database, schema);
        await from1To2(migrator, schema);
        return 2;
      default:
        throw ArgumentError.value('Unknown migration from $currentVersion');
    }
  };
}

i1.OnUpgrade stepByStep({
  required Future<void> Function(i1.Migrator m, Schema2 schema) from1To2,
}) =>
    i0.VersionedSchema.stepByStepHelper(
        step: migrationSteps(
      from1To2: from1To2,
    ));
