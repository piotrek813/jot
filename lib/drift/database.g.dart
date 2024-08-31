// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $ChoteItemsTable extends ChoteItems
    with TableInfo<$ChoteItemsTable, ChoteItem> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ChoteItemsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _contentMeta =
      const VerificationMeta('content');
  @override
  late final GeneratedColumn<String> content = GeneratedColumn<String>(
      'content', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, content, createdAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'chote_items';
  @override
  VerificationContext validateIntegrity(Insertable<ChoteItem> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('content')) {
      context.handle(_contentMeta,
          content.isAcceptableOrUnknown(data['content']!, _contentMeta));
    } else if (isInserting) {
      context.missing(_contentMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ChoteItem map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ChoteItem(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      content: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}content'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
    );
  }

  @override
  $ChoteItemsTable createAlias(String alias) {
    return $ChoteItemsTable(attachedDatabase, alias);
  }
}

class ChoteItem extends DataClass implements Insertable<ChoteItem> {
  final int id;
  final String content;
  final DateTime createdAt;
  const ChoteItem(
      {required this.id, required this.content, required this.createdAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['content'] = Variable<String>(content);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  ChoteItemsCompanion toCompanion(bool nullToAbsent) {
    return ChoteItemsCompanion(
      id: Value(id),
      content: Value(content),
      createdAt: Value(createdAt),
    );
  }

  factory ChoteItem.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ChoteItem(
      id: serializer.fromJson<int>(json['id']),
      content: serializer.fromJson<String>(json['content']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'content': serializer.toJson<String>(content),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  ChoteItem copyWith({int? id, String? content, DateTime? createdAt}) =>
      ChoteItem(
        id: id ?? this.id,
        content: content ?? this.content,
        createdAt: createdAt ?? this.createdAt,
      );
  ChoteItem copyWithCompanion(ChoteItemsCompanion data) {
    return ChoteItem(
      id: data.id.present ? data.id.value : this.id,
      content: data.content.present ? data.content.value : this.content,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ChoteItem(')
          ..write('id: $id, ')
          ..write('content: $content, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, content, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ChoteItem &&
          other.id == this.id &&
          other.content == this.content &&
          other.createdAt == this.createdAt);
}

class ChoteItemsCompanion extends UpdateCompanion<ChoteItem> {
  final Value<int> id;
  final Value<String> content;
  final Value<DateTime> createdAt;
  const ChoteItemsCompanion({
    this.id = const Value.absent(),
    this.content = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  ChoteItemsCompanion.insert({
    this.id = const Value.absent(),
    required String content,
    required DateTime createdAt,
  })  : content = Value(content),
        createdAt = Value(createdAt);
  static Insertable<ChoteItem> custom({
    Expression<int>? id,
    Expression<String>? content,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (content != null) 'content': content,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  ChoteItemsCompanion copyWith(
      {Value<int>? id, Value<String>? content, Value<DateTime>? createdAt}) {
    return ChoteItemsCompanion(
      id: id ?? this.id,
      content: content ?? this.content,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (content.present) {
      map['content'] = Variable<String>(content.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ChoteItemsCompanion(')
          ..write('id: $id, ')
          ..write('content: $content, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $TagItemsTable extends TagItems with TableInfo<$TagItemsTable, TagItem> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TagItemsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'));
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDate);
  @override
  List<GeneratedColumn> get $columns => [id, name, createdAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'tag_items';
  @override
  VerificationContext validateIntegrity(Insertable<TagItem> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TagItem map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TagItem(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
    );
  }

  @override
  $TagItemsTable createAlias(String alias) {
    return $TagItemsTable(attachedDatabase, alias);
  }
}

class TagItem extends DataClass implements Insertable<TagItem> {
  final int id;
  final String name;
  final DateTime createdAt;
  const TagItem(
      {required this.id, required this.name, required this.createdAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  TagItemsCompanion toCompanion(bool nullToAbsent) {
    return TagItemsCompanion(
      id: Value(id),
      name: Value(name),
      createdAt: Value(createdAt),
    );
  }

  factory TagItem.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TagItem(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  TagItem copyWith({int? id, String? name, DateTime? createdAt}) => TagItem(
        id: id ?? this.id,
        name: name ?? this.name,
        createdAt: createdAt ?? this.createdAt,
      );
  TagItem copyWithCompanion(TagItemsCompanion data) {
    return TagItem(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TagItem(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TagItem &&
          other.id == this.id &&
          other.name == this.name &&
          other.createdAt == this.createdAt);
}

class TagItemsCompanion extends UpdateCompanion<TagItem> {
  final Value<int> id;
  final Value<String> name;
  final Value<DateTime> createdAt;
  const TagItemsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  TagItemsCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    this.createdAt = const Value.absent(),
  }) : name = Value(name);
  static Insertable<TagItem> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  TagItemsCompanion copyWith(
      {Value<int>? id, Value<String>? name, Value<DateTime>? createdAt}) {
    return TagItemsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TagItemsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $ChoteTagTable extends ChoteTag
    with TableInfo<$ChoteTagTable, ChoteTagData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ChoteTagTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _choteIdMeta =
      const VerificationMeta('choteId');
  @override
  late final GeneratedColumn<int> choteId = GeneratedColumn<int>(
      'chote_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES chote_items (id)'));
  static const VerificationMeta _tagIdMeta = const VerificationMeta('tagId');
  @override
  late final GeneratedColumn<int> tagId = GeneratedColumn<int>(
      'tag_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES tag_items (id)'));
  @override
  List<GeneratedColumn> get $columns => [choteId, tagId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'chote_tag';
  @override
  VerificationContext validateIntegrity(Insertable<ChoteTagData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('chote_id')) {
      context.handle(_choteIdMeta,
          choteId.isAcceptableOrUnknown(data['chote_id']!, _choteIdMeta));
    } else if (isInserting) {
      context.missing(_choteIdMeta);
    }
    if (data.containsKey('tag_id')) {
      context.handle(
          _tagIdMeta, tagId.isAcceptableOrUnknown(data['tag_id']!, _tagIdMeta));
    } else if (isInserting) {
      context.missing(_tagIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  ChoteTagData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ChoteTagData(
      choteId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}chote_id'])!,
      tagId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}tag_id'])!,
    );
  }

  @override
  $ChoteTagTable createAlias(String alias) {
    return $ChoteTagTable(attachedDatabase, alias);
  }
}

class ChoteTagData extends DataClass implements Insertable<ChoteTagData> {
  final int choteId;
  final int tagId;
  const ChoteTagData({required this.choteId, required this.tagId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['chote_id'] = Variable<int>(choteId);
    map['tag_id'] = Variable<int>(tagId);
    return map;
  }

  ChoteTagCompanion toCompanion(bool nullToAbsent) {
    return ChoteTagCompanion(
      choteId: Value(choteId),
      tagId: Value(tagId),
    );
  }

  factory ChoteTagData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ChoteTagData(
      choteId: serializer.fromJson<int>(json['choteId']),
      tagId: serializer.fromJson<int>(json['tagId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'choteId': serializer.toJson<int>(choteId),
      'tagId': serializer.toJson<int>(tagId),
    };
  }

  ChoteTagData copyWith({int? choteId, int? tagId}) => ChoteTagData(
        choteId: choteId ?? this.choteId,
        tagId: tagId ?? this.tagId,
      );
  ChoteTagData copyWithCompanion(ChoteTagCompanion data) {
    return ChoteTagData(
      choteId: data.choteId.present ? data.choteId.value : this.choteId,
      tagId: data.tagId.present ? data.tagId.value : this.tagId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ChoteTagData(')
          ..write('choteId: $choteId, ')
          ..write('tagId: $tagId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(choteId, tagId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ChoteTagData &&
          other.choteId == this.choteId &&
          other.tagId == this.tagId);
}

class ChoteTagCompanion extends UpdateCompanion<ChoteTagData> {
  final Value<int> choteId;
  final Value<int> tagId;
  final Value<int> rowid;
  const ChoteTagCompanion({
    this.choteId = const Value.absent(),
    this.tagId = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ChoteTagCompanion.insert({
    required int choteId,
    required int tagId,
    this.rowid = const Value.absent(),
  })  : choteId = Value(choteId),
        tagId = Value(tagId);
  static Insertable<ChoteTagData> custom({
    Expression<int>? choteId,
    Expression<int>? tagId,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (choteId != null) 'chote_id': choteId,
      if (tagId != null) 'tag_id': tagId,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ChoteTagCompanion copyWith(
      {Value<int>? choteId, Value<int>? tagId, Value<int>? rowid}) {
    return ChoteTagCompanion(
      choteId: choteId ?? this.choteId,
      tagId: tagId ?? this.tagId,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (choteId.present) {
      map['chote_id'] = Variable<int>(choteId.value);
    }
    if (tagId.present) {
      map['tag_id'] = Variable<int>(tagId.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ChoteTagCompanion(')
          ..write('choteId: $choteId, ')
          ..write('tagId: $tagId, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $ChoteItemsTable choteItems = $ChoteItemsTable(this);
  late final $TagItemsTable tagItems = $TagItemsTable(this);
  late final $ChoteTagTable choteTag = $ChoteTagTable(this);
  late final ChoteDao choteDao = ChoteDao(this as AppDatabase);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [choteItems, tagItems, choteTag];
}

typedef $$ChoteItemsTableCreateCompanionBuilder = ChoteItemsCompanion Function({
  Value<int> id,
  required String content,
  required DateTime createdAt,
});
typedef $$ChoteItemsTableUpdateCompanionBuilder = ChoteItemsCompanion Function({
  Value<int> id,
  Value<String> content,
  Value<DateTime> createdAt,
});

final class $$ChoteItemsTableReferences
    extends BaseReferences<_$AppDatabase, $ChoteItemsTable, ChoteItem> {
  $$ChoteItemsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$ChoteTagTable, List<ChoteTagData>>
      _choteTagRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.choteTag,
              aliasName:
                  $_aliasNameGenerator(db.choteItems.id, db.choteTag.choteId));

  $$ChoteTagTableProcessedTableManager get choteTagRefs {
    final manager = $$ChoteTagTableTableManager($_db, $_db.choteTag)
        .filter((f) => f.choteId.id($_item.id));

    final cache = $_typedResult.readTableOrNull(_choteTagRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$ChoteItemsTableFilterComposer
    extends FilterComposer<_$AppDatabase, $ChoteItemsTable> {
  $$ChoteItemsTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get content => $state.composableBuilder(
      column: $state.table.content,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get createdAt => $state.composableBuilder(
      column: $state.table.createdAt,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ComposableFilter choteTagRefs(
      ComposableFilter Function($$ChoteTagTableFilterComposer f) f) {
    final $$ChoteTagTableFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $state.db.choteTag,
        getReferencedColumn: (t) => t.choteId,
        builder: (joinBuilder, parentComposers) =>
            $$ChoteTagTableFilterComposer(ComposerState(
                $state.db, $state.db.choteTag, joinBuilder, parentComposers)));
    return f(composer);
  }
}

class $$ChoteItemsTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $ChoteItemsTable> {
  $$ChoteItemsTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get content => $state.composableBuilder(
      column: $state.table.content,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get createdAt => $state.composableBuilder(
      column: $state.table.createdAt,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

class $$ChoteItemsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $ChoteItemsTable,
    ChoteItem,
    $$ChoteItemsTableFilterComposer,
    $$ChoteItemsTableOrderingComposer,
    $$ChoteItemsTableCreateCompanionBuilder,
    $$ChoteItemsTableUpdateCompanionBuilder,
    (ChoteItem, $$ChoteItemsTableReferences),
    ChoteItem,
    PrefetchHooks Function({bool choteTagRefs})> {
  $$ChoteItemsTableTableManager(_$AppDatabase db, $ChoteItemsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$ChoteItemsTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$ChoteItemsTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> content = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
          }) =>
              ChoteItemsCompanion(
            id: id,
            content: content,
            createdAt: createdAt,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String content,
            required DateTime createdAt,
          }) =>
              ChoteItemsCompanion.insert(
            id: id,
            content: content,
            createdAt: createdAt,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$ChoteItemsTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({choteTagRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (choteTagRefs) db.choteTag],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (choteTagRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable:
                            $$ChoteItemsTableReferences._choteTagRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$ChoteItemsTableReferences(db, table, p0)
                                .choteTagRefs,
                        referencedItemsForCurrentItem: (item,
                                referencedItems) =>
                            referencedItems.where((e) => e.choteId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$ChoteItemsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $ChoteItemsTable,
    ChoteItem,
    $$ChoteItemsTableFilterComposer,
    $$ChoteItemsTableOrderingComposer,
    $$ChoteItemsTableCreateCompanionBuilder,
    $$ChoteItemsTableUpdateCompanionBuilder,
    (ChoteItem, $$ChoteItemsTableReferences),
    ChoteItem,
    PrefetchHooks Function({bool choteTagRefs})>;
typedef $$TagItemsTableCreateCompanionBuilder = TagItemsCompanion Function({
  Value<int> id,
  required String name,
  Value<DateTime> createdAt,
});
typedef $$TagItemsTableUpdateCompanionBuilder = TagItemsCompanion Function({
  Value<int> id,
  Value<String> name,
  Value<DateTime> createdAt,
});

final class $$TagItemsTableReferences
    extends BaseReferences<_$AppDatabase, $TagItemsTable, TagItem> {
  $$TagItemsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$ChoteTagTable, List<ChoteTagData>>
      _choteTagRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
          db.choteTag,
          aliasName: $_aliasNameGenerator(db.tagItems.id, db.choteTag.tagId));

  $$ChoteTagTableProcessedTableManager get choteTagRefs {
    final manager = $$ChoteTagTableTableManager($_db, $_db.choteTag)
        .filter((f) => f.tagId.id($_item.id));

    final cache = $_typedResult.readTableOrNull(_choteTagRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$TagItemsTableFilterComposer
    extends FilterComposer<_$AppDatabase, $TagItemsTable> {
  $$TagItemsTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get createdAt => $state.composableBuilder(
      column: $state.table.createdAt,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ComposableFilter choteTagRefs(
      ComposableFilter Function($$ChoteTagTableFilterComposer f) f) {
    final $$ChoteTagTableFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $state.db.choteTag,
        getReferencedColumn: (t) => t.tagId,
        builder: (joinBuilder, parentComposers) =>
            $$ChoteTagTableFilterComposer(ComposerState(
                $state.db, $state.db.choteTag, joinBuilder, parentComposers)));
    return f(composer);
  }
}

class $$TagItemsTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $TagItemsTable> {
  $$TagItemsTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get createdAt => $state.composableBuilder(
      column: $state.table.createdAt,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

class $$TagItemsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $TagItemsTable,
    TagItem,
    $$TagItemsTableFilterComposer,
    $$TagItemsTableOrderingComposer,
    $$TagItemsTableCreateCompanionBuilder,
    $$TagItemsTableUpdateCompanionBuilder,
    (TagItem, $$TagItemsTableReferences),
    TagItem,
    PrefetchHooks Function({bool choteTagRefs})> {
  $$TagItemsTableTableManager(_$AppDatabase db, $TagItemsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$TagItemsTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$TagItemsTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
          }) =>
              TagItemsCompanion(
            id: id,
            name: name,
            createdAt: createdAt,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String name,
            Value<DateTime> createdAt = const Value.absent(),
          }) =>
              TagItemsCompanion.insert(
            id: id,
            name: name,
            createdAt: createdAt,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) =>
                  (e.readTable(table), $$TagItemsTableReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: ({choteTagRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (choteTagRefs) db.choteTag],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (choteTagRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable:
                            $$TagItemsTableReferences._choteTagRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$TagItemsTableReferences(db, table, p0)
                                .choteTagRefs,
                        referencedItemsForCurrentItem: (item,
                                referencedItems) =>
                            referencedItems.where((e) => e.tagId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$TagItemsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $TagItemsTable,
    TagItem,
    $$TagItemsTableFilterComposer,
    $$TagItemsTableOrderingComposer,
    $$TagItemsTableCreateCompanionBuilder,
    $$TagItemsTableUpdateCompanionBuilder,
    (TagItem, $$TagItemsTableReferences),
    TagItem,
    PrefetchHooks Function({bool choteTagRefs})>;
typedef $$ChoteTagTableCreateCompanionBuilder = ChoteTagCompanion Function({
  required int choteId,
  required int tagId,
  Value<int> rowid,
});
typedef $$ChoteTagTableUpdateCompanionBuilder = ChoteTagCompanion Function({
  Value<int> choteId,
  Value<int> tagId,
  Value<int> rowid,
});

final class $$ChoteTagTableReferences
    extends BaseReferences<_$AppDatabase, $ChoteTagTable, ChoteTagData> {
  $$ChoteTagTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $ChoteItemsTable _choteIdTable(_$AppDatabase db) => db.choteItems
      .createAlias($_aliasNameGenerator(db.choteTag.choteId, db.choteItems.id));

  $$ChoteItemsTableProcessedTableManager? get choteId {
    if ($_item.choteId == null) return null;
    final manager = $$ChoteItemsTableTableManager($_db, $_db.choteItems)
        .filter((f) => f.id($_item.choteId!));
    final item = $_typedResult.readTableOrNull(_choteIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $TagItemsTable _tagIdTable(_$AppDatabase db) => db.tagItems
      .createAlias($_aliasNameGenerator(db.choteTag.tagId, db.tagItems.id));

  $$TagItemsTableProcessedTableManager? get tagId {
    if ($_item.tagId == null) return null;
    final manager = $$TagItemsTableTableManager($_db, $_db.tagItems)
        .filter((f) => f.id($_item.tagId!));
    final item = $_typedResult.readTableOrNull(_tagIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$ChoteTagTableFilterComposer
    extends FilterComposer<_$AppDatabase, $ChoteTagTable> {
  $$ChoteTagTableFilterComposer(super.$state);
  $$ChoteItemsTableFilterComposer get choteId {
    final $$ChoteItemsTableFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.choteId,
        referencedTable: $state.db.choteItems,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) =>
            $$ChoteItemsTableFilterComposer(ComposerState($state.db,
                $state.db.choteItems, joinBuilder, parentComposers)));
    return composer;
  }

  $$TagItemsTableFilterComposer get tagId {
    final $$TagItemsTableFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.tagId,
        referencedTable: $state.db.tagItems,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) =>
            $$TagItemsTableFilterComposer(ComposerState(
                $state.db, $state.db.tagItems, joinBuilder, parentComposers)));
    return composer;
  }
}

class $$ChoteTagTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $ChoteTagTable> {
  $$ChoteTagTableOrderingComposer(super.$state);
  $$ChoteItemsTableOrderingComposer get choteId {
    final $$ChoteItemsTableOrderingComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.choteId,
        referencedTable: $state.db.choteItems,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) =>
            $$ChoteItemsTableOrderingComposer(ComposerState($state.db,
                $state.db.choteItems, joinBuilder, parentComposers)));
    return composer;
  }

  $$TagItemsTableOrderingComposer get tagId {
    final $$TagItemsTableOrderingComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.tagId,
        referencedTable: $state.db.tagItems,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) =>
            $$TagItemsTableOrderingComposer(ComposerState(
                $state.db, $state.db.tagItems, joinBuilder, parentComposers)));
    return composer;
  }
}

class $$ChoteTagTableTableManager extends RootTableManager<
    _$AppDatabase,
    $ChoteTagTable,
    ChoteTagData,
    $$ChoteTagTableFilterComposer,
    $$ChoteTagTableOrderingComposer,
    $$ChoteTagTableCreateCompanionBuilder,
    $$ChoteTagTableUpdateCompanionBuilder,
    (ChoteTagData, $$ChoteTagTableReferences),
    ChoteTagData,
    PrefetchHooks Function({bool choteId, bool tagId})> {
  $$ChoteTagTableTableManager(_$AppDatabase db, $ChoteTagTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$ChoteTagTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$ChoteTagTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<int> choteId = const Value.absent(),
            Value<int> tagId = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              ChoteTagCompanion(
            choteId: choteId,
            tagId: tagId,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required int choteId,
            required int tagId,
            Value<int> rowid = const Value.absent(),
          }) =>
              ChoteTagCompanion.insert(
            choteId: choteId,
            tagId: tagId,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) =>
                  (e.readTable(table), $$ChoteTagTableReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: ({choteId = false, tagId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (choteId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.choteId,
                    referencedTable:
                        $$ChoteTagTableReferences._choteIdTable(db),
                    referencedColumn:
                        $$ChoteTagTableReferences._choteIdTable(db).id,
                  ) as T;
                }
                if (tagId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.tagId,
                    referencedTable: $$ChoteTagTableReferences._tagIdTable(db),
                    referencedColumn:
                        $$ChoteTagTableReferences._tagIdTable(db).id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$ChoteTagTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $ChoteTagTable,
    ChoteTagData,
    $$ChoteTagTableFilterComposer,
    $$ChoteTagTableOrderingComposer,
    $$ChoteTagTableCreateCompanionBuilder,
    $$ChoteTagTableUpdateCompanionBuilder,
    (ChoteTagData, $$ChoteTagTableReferences),
    ChoteTagData,
    PrefetchHooks Function({bool choteId, bool tagId})>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$ChoteItemsTableTableManager get choteItems =>
      $$ChoteItemsTableTableManager(_db, _db.choteItems);
  $$TagItemsTableTableManager get tagItems =>
      $$TagItemsTableTableManager(_db, _db.tagItems);
  $$ChoteTagTableTableManager get choteTag =>
      $$ChoteTagTableTableManager(_db, _db.choteTag);
}

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$driftHash() => r'd784a91bf30aff5dea6f4c77684880795e91b146';

/// See also [drift].
@ProviderFor(drift)
final driftProvider = AutoDisposeProvider<AppDatabase>.internal(
  drift,
  name: r'driftProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$driftHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef DriftRef = AutoDisposeProviderRef<AppDatabase>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
