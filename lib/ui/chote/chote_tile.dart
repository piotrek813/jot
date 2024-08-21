import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jot/model/chote.dart';
import 'package:jot/ui/chote/chote_tile_images.dart';
import 'package:jot/ui/chote/chote_tile_text.dart';
import 'package:jot/ui/form/edit_text_field.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'chote_tile.g.dart';

@riverpod
Chote currentChote(CurrentChoteRef ref) {
  throw UnimplementedError();
}

class ChoteTile extends ConsumerWidget {
  const ChoteTile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final chote = ref.watch(currentChoteProvider);
    return Dismissible(
      direction: DismissDirection.startToEnd,
      key: Key(chote.id!),
      confirmDismiss: (_) => Future.value(false),
      onUpdate: (details) {
        if (!details.reached) return;

        ref.read(editedChoteProvider.notifier).state = chote;
      },
      child: GestureDetector(
        onLongPress: _onLongPress,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 4.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              if (chote.files != null && chote.files!.isNotEmpty)
                const FractionallySizedBox(
                    widthFactor: 0.8, child: ChoteTileImages()),
              if (chote.text.isNotEmpty)
                const Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ChoteTileText(),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }

  void _onLongPress() {}
}
