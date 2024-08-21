import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:jot/model/chote.dart';
import 'package:jot/service/file_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'chote_service.g.dart';

class ChoteService {
  final FirebaseFirestore db;
  final CollectionReference<Chote> collection;
  ChoteService({required this.db})
      : collection = db.collection('chotes').withConverter(
            fromFirestore: Chote.fromFirestore,
            toFirestore: (chote, _) => chote.toFirestore());

  void add(Chote chote) async {
    final choteRef = collection.doc();

    if (chote.createdDate == null) {
      chote = chote.copyWith(createdDate: DateTime.now());
    }

    if (chote.files != null) {
      final futureRemoteFiles = chote.files!.map(
          (e) => FileService(FirebaseStorage.instance).put(e, choteRef.id));

      final remoteFiles = await Future.wait(futureRemoteFiles);
      print(remoteFiles);

      chote = chote.copyWith(files: remoteFiles.toSet());
    }

    choteRef.set(chote);
  }

  Future<Chote?> getById(String id) async {
    return (await collection.doc(id).get()).data();
  }

  Future<List<Chote>> getLast() async {
    final snapshot =
        await collection.orderBy('createdDate', descending: true).get();

    final data = snapshot.docs.map((e) => e.data()).toList();

    return data;
  }

  Stream<List<Chote>> watch() async* {
    final snapshots =
        collection.orderBy('createdDate', descending: true).snapshots();

    yield* snapshots.map((snap) => snap.docs.map((doc) => doc.data()).toList());
  }
}

@riverpod
ChoteService choteService(ChoteServiceRef ref) {
  return ChoteService(db: FirebaseFirestore.instance);
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
