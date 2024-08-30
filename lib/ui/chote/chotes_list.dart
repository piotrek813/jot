import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:jot_notes/providers/chotes_provider.dart';
import 'package:jot_notes/ui/chote/chote_tile.dart';

class ChotesList extends ConsumerStatefulWidget {
  const ChotesList({super.key});

  @override
  ConsumerState<ChotesList> createState() => _ChotesListState();
}

class _ChotesListState extends ConsumerState<ChotesList> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      final maxScroll = _scrollController.position.maxScrollExtent;
      final currentScroll = _scrollController.position.pixels;

      if (currentScroll == maxScroll) {
        ref.read(chotesProvider.notifier).loadPrevious();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();

    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final chotes = ref.watch(chotesProvider).valueOrNull;

    if (chotes == null) return const SizedBox();

    return ListView.builder(
        controller: _scrollController,
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
