import 'package:jot_notes/model/chote.dart';
import 'package:jot_notes/repository/model/chote_dto.dart';
import 'package:sqflite/sqflite.dart';

class ChoteRepository {
  Database db;
  final tableName = "Chote";

  ChoteRepository({required this.db});

  Future<void> save(Chote chote) async {
    final choteDto = ChoteDto(id: chote.id, text: chote.text, createdDate: chote.createdDate?.millisecondsSinceEpoch);
    
    // db.insert(tableName, choteDto.toJson(), conflictAlgorithm:ConflictAlgorithm.replace );
  }


  Future<void> delete(Chote chote) async {
    db.delete(tableName, );
  }
}
