import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:jot_notes/model/chote.dart';
import 'package:jot_notes/service/auth_service.dart/auth_service.dart';

abstract class ChoteService {
  final FirebaseFirestore db;
  final CollectionReference<Chote> collection;
  final AuthService authService;
  ChoteService(
      {required this.db, required this.collection, required this.authService});

  Future<void> save(Chote chote);

  Future<void> processFiles(
      Set<String>? files, DocumentReference<Chote> choteRef);

  Future<void> delete(Chote chote);

  Future<void> deleteAll(List<Chote> chotes);

  Future<Chote?> getById(String id);

  Future<List<Chote>> getLast();

  Stream<List<Chote>> watch();
}
