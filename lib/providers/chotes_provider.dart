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

  Future<void> loadPrevious() async {
    final prev = await ref.watch(choteServiceProvider).get(state.value!.length);
    state = AsyncValue.data([...state.value!, ...prev]);
  }

  Future<void> add({required String text, Set<String>? files}) async {
    final choteService = ref.watch(choteServiceProvider);

    final chote = await choteService.create(text: text, files: files);

    state = AsyncValue.data([chote, ...state.value!]);
  }

  Future<void> save(Chote chote) async {
    final choteService = ref.watch(choteServiceProvider);

    await choteService.save(chote);

    state = AsyncValue.data([
      for (final e in state.value!)
        if (chote.id == e.id) chote
        else e 
    ]);
  }

  Future<void> deleteAll(List<Chote> chotes) async {
    ref.watch(choteServiceProvider).deleteAll(chotes);

    state = AsyncValue.data([
      for (final e in state.value!)
        if (!chotes.contains(e)) e
    ]);
  }
}

