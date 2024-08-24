import 'package:jot_notes/model/chote.dart';
import 'package:jot_notes/service/chote_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'chotes_provider.g.dart';

@riverpod
class Chotes extends _$Chotes  {
  @override
  Future<List<Chote>> build() {
    return ref.watch(choteServiceProvider).get(0);
  }

  Future<void> add({required String text, Set<String>? files}) async {
    final choteService = ref.watch(choteServiceProvider);

    final chote = await choteService.create(text: text);

    state = AsyncValue.data([chote, ...state.value!]);
  }

  Future<void> deleteAll(List<Chote> chotes) async {
    ref.watch(choteServiceProvider).deleteAll(chotes);


    state = AsyncValue.data([
      for (final e in state.value!)
        if (!chotes.contains(e)) e
    ]);
  }
}

