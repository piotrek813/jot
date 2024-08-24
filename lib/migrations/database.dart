
import 'package:path/path.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sqflite/sqflite.dart';

part 'database.g.dart';

_onConfigure(Database db) async {
  // Add support for cascade delete
  await db.execute("PRAGMA foreign_keys = ON");
}

void _createTableChoteV1(Batch batch) {
  batch.execute('DROP TABLE IF EXISTS Chote');
  batch.execute('''CREATE TABLE Chote (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    text TEXT,
    createdDate INTEGER 
)''');
}

void _createTableFileV1(Batch batch) {
  batch.execute('DROP TABLE IF EXISTS File');
  batch.execute('''CREATE TABLE File (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    path TEXT,
    createdDate TEXT,
    choteId INTEGER,
    FOREIGN KEY (choteId) REFERENCES Chote(id) ON DELETE CASCADE
)''');
}

Future<Database> openDB() async {
  final db = await openDatabase(join(await getDatabasesPath(), "main.db"),
      onConfigure: _onConfigure,
      onCreate: (db, version)async {
      var batch = db.batch();
      _createTableChoteV1(batch);
      _createTableFileV1(batch);
      await batch.commit();
      },version: 1);

  return db;
}


@riverpod
Database database(DatabaseRef ref) {
  throw UnimplementedError();
}
