import 'dart:async';

import 'package:jot_notes/model/chote.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'chote_service.g.dart';

class ChoteService {
  ChoteService();

  Future<void> save(Chote chote) async {
    if (chote.createdDate == null) {
      chote = chote.copyWith(createdDate: DateTime.now());
    }

    // here we are checking id because when id != null files are already uploaded
    // and since we aren't alowing for modifications we skip this step
    if (chote.id == null) {
      processFiles(chote.files);
    }
  }

  Future<void> processFiles(
      Set<String>? files) async {
    if (files != null) {
      // final futureRemoteFiles = files.map(
      //     (e) => FileService(FirebaseStorage.instance).put(e, choteRef.id));
      //
      // final remoteFiles = await Future.wait(futureRemoteFiles);
      //
      // await choteRef.update({"files": remoteFiles});
    }
  }

  Future<void> delete(Chote chote) async {
  }

  Future<void> deleteAll(List<Chote> chotes) async {
  }

  Future<Chote?> getById(String id) async {
    return null;
  }

  Stream<List<Chote>> watch() async* {
  }
}

@riverpod
ChoteService choteService(ChoteServiceRef ref) {
  return ChoteService();
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
