import 'package:jot_notes/model/chote.dart';
import 'package:jot_notes/service/chote_service.dart';
import 'package:jot_notes/ui/filter/tag_filter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'chotes_provider.g.dart';

@riverpod
Stream<List<Chote>> chotesList(ChotesListRef ref) {
  final tags = ref.watch(selectedTags);
  print("choteList");
  print(tags);
  return  ref.watch(choteServiceProvider).watch(tags: tags);
}

