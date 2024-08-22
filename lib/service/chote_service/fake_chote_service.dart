import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:jot_notes/model/chote.dart';
import 'package:jot_notes/service/auth_service.dart/auth_service.dart';
import 'package:jot_notes/service/chote_service/chote_service.dart';

class FakeChoteService implements ChoteService {
  @override
  AuthService get authService => throw UnimplementedError();

  @override
  CollectionReference<Chote> get collection => throw UnimplementedError();

  @override
  FirebaseFirestore get db => throw UnimplementedError();

  @override
  Future<void> delete(Chote chote) {
    throw UnimplementedError();
  }

  @override
  Future<void> deleteAll(List<Chote> chotes) {
    throw UnimplementedError();
  }

  @override
  Future<Chote?> getById(String id) {
    throw UnimplementedError();
  }

  @override
  Future<List<Chote>> getLast() {
    throw UnimplementedError();
  }

  @override
  Future<void> processFiles(
      Set<String>? files, DocumentReference<Chote> choteRef) {
    throw UnimplementedError();
  }

  @override
  Future<void> save(Chote chote) {
    throw UnimplementedError();
  }

  @override
  Stream<List<Chote>> watch() {
    throw UnimplementedError();
  }
}
