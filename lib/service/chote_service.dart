import 'dart:async';

import 'package:jot_notes/model/chote.dart';
import 'package:jot_notes/repository/chote_repository.dart';
import 'package:jot_notes/repository/model/chote_dto.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'chote_service.g.dart';

class ChoteService {
  final ChoteRepository choteRepository;
  ChoteService({required this.choteRepository});

  Chote fromDto(ChoteDto dto) {
    return Chote(
        id: dto.id,
        text: dto.text,
        createdDate: DateTime.fromMillisecondsSinceEpoch(dto.createdDate));
  }

  Future<Chote> create({required String text, Set<String>? files}) async {
    final dto = await choteRepository
        .save(Chote(text: text, createdDate: DateTime.now()));

    return fromDto(dto);
  }

  Future<void> save(Chote chote) async {
    choteRepository.save(chote);
  }

  Future<void> processFiles(Set<String>? files) async {
    if (files != null) {
      // final futureRemoteFiles = files.map(
      //     (e) => FileService(FirebaseStorage.instance).put(e, choteRef.id));
      //
      // final remoteFiles = await Future.wait(futureRemoteFiles);
      //
      // await choteRef.update({"files": remoteFiles});
    }
  }

  Future<void> delete(Chote chote) async {}

  Future<void> deleteAll(List<Chote> chotes) async {
    choteRepository.deleteAll(chotes.map((e) => e.id).nonNulls.toList());
  }

  Future<Chote?> getById(String id) async {
    return null;
  }

  Future<List<Chote>> get(offset) async {
    final dtos = await choteRepository.get(offset);
    return dtos.map(fromDto).toList();
  }

  Future<List<Chote>> query(String query) async {
    if(query.trim().isEmpty) return [];

    final dtos = await choteRepository.query(query);
    return dtos.map(fromDto).toList();
  }
}

@riverpod
ChoteService choteService(ChoteServiceRef ref) {
  final choteRepository = ref.watch(choteRepositoryProvider);
  return ChoteService(choteRepository: choteRepository);
}
