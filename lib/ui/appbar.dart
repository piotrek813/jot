import 'package:drift_db_viewer/drift_db_viewer.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jot_notes/drift/database.dart';
import 'package:jot_notes/service/chote_service.dart';
import 'package:jot_notes/ui/chote/chote_tile.dart';
import 'package:jot_notes/ui/form/edit_text_field.dart';
import 'package:jot_notes/ui/search/search_screen.dart';

class ChatAppBar extends ConsumerWidget implements PreferredSizeWidget {
  const ChatAppBar({super.key});

  @override
  final Size preferredSize = const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: const Text("Moje notatki"),
      actions: [
        if (!kReleaseMode)
          IconButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) =>
                        DriftDbViewer(ref.read(driftProvider))));
              },
              icon: const Icon(Icons.dataset)),
        IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const SearchScreen();
              }));
            },
            icon: const Icon(Icons.search))
      ],
    );
  }
}

class SelectOptionsdAppBar extends ConsumerWidget
    implements PreferredSizeWidget {
  const SelectOptionsdAppBar({super.key});

  @override
  final Size preferredSize = const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedChotes = ref.watch(selectedChotesProvider);

    return AppBar(
      leading: IconButton(
          onPressed: () => ref.read(selectedChotesProvider.notifier).clear(),
          icon: const Icon(Icons.arrow_back)),
      title: Text("${selectedChotes.length}"),
      actions: [
        if (selectedChotes.length == 1 && selectedChotes.first.text.isNotEmpty)
          IconButton(
              tooltip: "Edytuj",
              onPressed: () {
                ref.read(editedChoteProvider.notifier).state =
                    selectedChotes.first;
                ref.read(selectedChotesProvider.notifier).clear();
              },
              icon: const Icon(Icons.edit)),
        IconButton(
            tooltip: "Usuń",
            onPressed: () {
              ref.read(choteServiceProvider).deleteAll(selectedChotes);
              ref.read(selectedChotesProvider.notifier).clear();
            },
            icon: const Icon(Icons.delete))
      ],
    );
  }
}
