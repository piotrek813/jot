import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jot_notes/model/chote.dart';
import 'package:jot_notes/ui/chote/chote_link_preview.dart';
import 'package:jot_notes/ui/chote/chote_tile_images.dart';
import 'package:jot_notes/ui/chote/chote_tile_text.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'chote_tile.g.dart';

@riverpod
Chote currentChote(CurrentChoteRef ref) {
  throw UnimplementedError();
}

@riverpod
class SelectedChotes extends _$SelectedChotes {
  @override
  List<Chote> build() {
    return [];
  }

  void add(Chote chote) {
    for (final c in state) {
      if (c.id == chote.id) {
        return remove(chote);
      }
    }

    state = [...state, chote];
  }

  void remove(Chote chote) {
    state = [
      for (final c in state)
        if (c.id != chote.id) c
    ];
  }

  void clear() {
    state = [];
  }
}

@riverpod
bool areChotesSelected(AreChotesSelectedRef ref) {
  return ref.watch(selectedChotesProvider).isNotEmpty;
}

class ChoteGestureDetector extends ConsumerWidget {
  const ChoteGestureDetector({required this.child, super.key});
  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
        onLongPress: () => _onLongPress(ref),
        onTap: () => _onTap(ref),
        child: AbsorbPointer(
          absorbing: ref.watch(areChotesSelectedProvider),
          child: child,
        ));
  }

  _onTap(WidgetRef ref) {
    if (ref.read(areChotesSelectedProvider)) {
      final chote = ref.read(currentChoteProvider);
      ref.watch(selectedChotesProvider.notifier).add(chote);
    }
  }

  _onLongPress(WidgetRef ref) {
    final chote = ref.read(currentChoteProvider);
    ref.watch(selectedChotesProvider.notifier).add(chote);
  }
}

class ChoteTile extends ConsumerWidget {
  const ChoteTile({super.key});

  String? getLink(String input) {
    return linkRegex.firstMatch(input)?[0];
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final chote = ref.watch(currentChoteProvider);

    final link = getLink(chote.text);

    return Dismissible(
      direction: DismissDirection.startToEnd,
      key: Key("${chote.id}"),
      confirmDismiss: (_) => Future.value(false),
      onUpdate: (details) {
        if (!details.reached) return;
      },
      child: ChoteGestureDetector(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 4.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              if (link != null)
                ConstrainedBox(
                    constraints:
                        const BoxConstraints(minHeight: 40, maxHeight: 120),
                    child: ChoteLinkPreview(link)),
              if (chote.files.isNotEmpty)
                const FractionallySizedBox(
                    widthFactor: 0.8, child: ChoteTileImages()),
              if (chote.text.isNotEmpty) const Align(alignment: Alignment.centerRight,child: ChoteTileText()),
            ],
          ),
        ),
      ),
    );
  }
}
