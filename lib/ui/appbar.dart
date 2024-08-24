import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jot_notes/service/chote_service.dart';
import 'package:jot_notes/ui/chote/chote_tile.dart';
import 'package:jot_notes/ui/form/edit_text_field.dart';

class ChatAppBar extends ConsumerWidget implements PreferredSizeWidget {
  const ChatAppBar({super.key});

  @override
  final Size preferredSize = const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const ImageProvider image = AssetImage('assets/camus.jpg');

    return AppBar(
      leading: const Padding(
        padding: EdgeInsets.all(8.0),
        child: CircleAvatar(
          foregroundImage: image,
        ),
      ),
      title: const Text("Moje notatki"),
      actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.search))],
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
