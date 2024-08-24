import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:jot_notes/providers/chotes_provider.dart';
import 'package:jot_notes/ui/chote/chote_tile.dart';

class ChotesList extends ConsumerWidget {
  const ChotesList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final chotes = ref.watch(chotesProvider).valueOrNull;

    if (chotes == null) return const SizedBox();

    return ListView.builder(
        reverse: true,
        itemCount: chotes.length,
        itemBuilder: (context, index) {
          final chote = chotes[index];
          final nextChote = chotes.elementAtOrNull(index);

          final List<Widget> children = [];

          if (chote.createdDate.day != nextChote?.createdDate.day) {
            children.add(Text(DateFormat("EEE, MMM d")
                .format(chote.createdDate)
                .toString()));
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
