import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:jot_notes/model/chote.dart';
import 'package:jot_notes/service/auth_service.dart/auth_service.dart';
import 'package:jot_notes/service/chote_service/chote_service.dart';
import 'package:jot_notes/service/chote_service/fake_chote_service.dart';
import 'package:jot_notes/service/file_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'chote_service.g.dart';

class ChoteServiceImpl implements ChoteService {
  @override
  final FirebaseFirestore db;
  @override
  CollectionReference<Chote> collection;
  @override
  final AuthService authService;

  ChoteServiceImpl(
      {required this.db, required this.collection, required this.authService});

  @override
  Future<void> save(Chote chote) async {
    final ownerId = authService.currentUser?.uid;
    if (ownerId == null) return;

    final choteRef = collection.doc(chote.id);

    if (chote.createdDate == null) {
      chote = chote.copyWith(createdDate: DateTime.now());
    }

    if (chote.ownerId == null) {
      chote = chote.copyWith(ownerId: ownerId);
    }

    // here we are checking id because when id != null files are already uploaded
    // and since we aren't alowing for modifications we skip this step
    if (chote.id == null) {
      processFiles(chote.files, choteRef);
    }

    choteRef.set(chote);
  }

  @override
  Future<void> processFiles(
      Set<String>? files, DocumentReference<Chote> choteRef) async {
    if (files != null) {
      final futureRemoteFiles = files.map(
          (e) => FileService(FirebaseStorage.instance).put(e, choteRef.id));

      final remoteFiles = await Future.wait(futureRemoteFiles);

      await choteRef.update({"files": remoteFiles});
    }
  }

  @override
  Future<void> delete(Chote chote) {
    return collection.doc(chote.id).delete();
  }

  @override
  Future<void> deleteAll(List<Chote> chotes) {
    final batch = db.batch();

    for (final c in chotes) {
      final doc = collection.doc(c.id);
      batch.delete(doc);
    }

    return batch.commit();
  }

  @override
  Future<Chote?> getById(String id) async {
    return (await collection.doc(id).get()).data();
  }

  @override
  Future<List<Chote>> getLast() async {
    final snapshot =
        await collection.orderBy('createdDate', descending: true).get();

    final data = snapshot.docs.map((e) => e.data()).toList();

    return data;
  }

  @override
  Stream<List<Chote>> watch() async* {
    final snapshots =
        collection.orderBy('createdDate', descending: true).snapshots();

    yield* snapshots.map((snap) => snap.docs.map((doc) => doc.data()).toList());
  }
}

@riverpod
ChoteService choteService(ChoteServiceRef ref) {
  ref.listen(authStateChangesProvider, (_, __) {
    ref.invalidateSelf();
  });

  final authService = ref.watch(authServiceProvider);
  final db = FirebaseFirestore.instance;

  // make it less destructive
  if (authService.currentUser == null) return FakeChoteService();

  final collection = db
      .collection('chotes/${authService.currentUser!.uid}/chotes')
      .withConverter(
          fromFirestore: Chote.fromFirestore,
          toFirestore: (chote, _) => chote.toFirestore());

  return ChoteServiceImpl(
      db: db, collection: collection, authService: authService);
}

@riverpod
class Chotes extends _$Chotes {
  @override
  Future<List<Chote>> build() async {
    ref
        .watch(choteServiceProvider)
        .watch()
        .listen((data) => state = AsyncValue.data(data));
    return [];
  }
}
