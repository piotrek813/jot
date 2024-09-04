import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:jot_notes/providers/chotes_provider.dart';
import 'package:jot_notes/ui/chote/chote_tile.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'chotes_list.g.dart';

@riverpod
int page(PageRef ref) {
  return 0;
}

class ChotesList extends ConsumerStatefulWidget {
  const ChotesList({super.key});

  @override
  ConsumerState<ChotesList> createState() => _ChotesListState();
}

class _ChotesListState extends ConsumerState<ChotesList> {
  @override
  Widget build(BuildContext context) {
    final chotes = ref.watch(chotesListProvider).valueOrNull;

    if (chotes == null) return const SizedBox();

    return ListView.builder(
        reverse: true,
        itemCount: chotes.length,
        itemBuilder: (context, index) {
          final chote = chotes[index];
          final nextChote = chotes.elementAtOrNull(index +1);

          final List<Widget> children = [];

          if (chote.createdDate.day != nextChote?.createdDate.day) {
            children.add(Text(
                DateFormat("EEE, MMM d").format(chote.createdDate).toString()));
          }

          children.add(ProviderScope(
              overrides: [currentChoteProvider.overrideWithValue(chote)],
              child: const ChoteTile()));

          if (children.length == 1) return children[0];

          return Column(
            children: children,
          );
        });
  }
}
