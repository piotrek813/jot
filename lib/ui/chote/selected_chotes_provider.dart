import 'package:jot/model/chote.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'selected_chotes_provider.g.dart';

@riverpod
class SelectedChotesProvider extends _$SelectedChotesProvider {
  @override
  List<Chote> build() {
    return [];
  }

  void add(Chote chote) {
    state = [chote, ...state];
  }

  void remove(Chote c) {
    state = [
      for (final chote in state)
        if (chote != c) chote
    ];
  }
}
