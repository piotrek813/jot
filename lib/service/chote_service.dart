import 'dart:async';

import 'package:jot_notes/model/chote.dart';
import 'package:jot_notes/repository/chote_repository.dart';
import 'package:jot_notes/service/file_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'chote_service.g.dart';

class ChoteService {
  final ChoteRepository choteRepository;
  ChoteService({required this.choteRepository});


  Future<Chote> create({required String text, Set<String>? files}) async {
    final savedFiles = await processFiles(files);

    final chote = await choteRepository
        .save(Chote(text: text, createdDate: DateTime.now(), files: savedFiles));

    return chote;
  }

  Future<void> save(Chote chote) async {
    choteRepository.save(chote);
  }

  Future<Set<String>> processFiles(Set<String>? files) async {
    if (files != null) {
      final futureMovedFiles = files.map(
          (e) => FileService().put(e));

      return (await Future.wait(futureMovedFiles)).toSet();
    }

    return {};
  }

  Future<void> delete(Chote chote) async {}

  Future<void> deleteAll(List<Chote> chotes) async {
    choteRepository.deleteAll(chotes.map((e) => e.id).nonNulls.toList());
  }

  Future<Chote?> getById(String id) async {
    return null;
  }

  Stream<List<Chote>> watch({List<String> tags = const []}) async* {
    yield* choteRepository.watch(tags: tags);
  }

  Future<List<Chote>> query(String query) async {
    if(query.trim().isEmpty) return [];

    final chotes = await choteRepository.query(query);
    return chotes.toList();
  }
}

@riverpod
ChoteService choteService(ChoteServiceRef ref) {
  final choteRepository = ref.watch(choteRepositoryProvider);
  return ChoteService(choteRepository: choteRepository);
}
