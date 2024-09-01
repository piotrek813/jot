import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jot_notes/service/file_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'chote_additional_actions.g.dart';

@riverpod
class ShowAdditionalActions extends _$ShowAdditionalActions {
  @override
  bool build() {
    return false;
  }

  void toggle() {
    state = !state;
  }

  void show() {
    state = true;
  }

  void hide() {
    state = false;
  }
}

class ChoteAdditionalActions extends ConsumerWidget {
  const ChoteAdditionalActions({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final showAdditionalActions = ref.watch(showAdditionalActionsProvider);

    if (!showAdditionalActions) return const SizedBox();

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            children: [
              IconButton(
                  onPressed:
                      ref.read(choteFilePickerProvider.notifier).pickMultiImages,
                  icon: const Icon(Icons.photo)),
              const Text("Galeria")
            ],
          ),
          Column(
            children: [
              IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.notifications_rounded)),
              const Text("Przypominajka")
            ],
          ),
        ],
      ),
    );
  }
}
