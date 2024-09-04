import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jot_notes/config/colors.dart';
import 'package:jot_notes/repository/tag_repository.dart';
import 'package:jot_notes/ui/form/form.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'tag_filter.g.dart';

@riverpod
Stream<List<String>> tags(TagsRef ref) {
  final tagRepository = ref.watch(tagRepositoryProvider);

  return tagRepository.watch();
}

final selectedTagsProvider = StateProvider<List<String>>((ref) {
  return [];
});

class TagFilter extends ConsumerStatefulWidget {
  const TagFilter({super.key});

  @override
  ConsumerState<TagFilter> createState() => _TagFilterState();
}

class _TagFilterState extends ConsumerState<TagFilter> {
  final controller = TextEditingController();
  List<String> selected = [];

  @override
  void dispose() {
    super.dispose();

    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final tags = ref.watch(tagsProvider).valueOrNull;

    if (tags == null) return const SizedBox();

    final List<String> items;

    if (controller.text.trim().isNotEmpty) {
      items = tags.where((e) => e.contains(controller.text)).toList();
    } else {
      items = tags;
    }

    final textTheme = Theme.of(context).textTheme;

    final selectedTags = ref.watch(selectedTagsProvider);

    String selectedText = selectedTags.join(", ");
    if (selectedTags.length > 8) {
      selectedText = "${selectedText.substring(0, 8)}...";
    } else if (selectedText.isNotEmpty) {
      selectedText = "$selectedText...";
    }

    return ActionChip(
        avatar: const Icon(Icons.label),
        label: Text("Tagi $selectedText"),
        onPressed: () async {
          await showModalBottomSheet<List<String>?>(
              context: context,
              backgroundColor: AacColors.white,
              builder: (context) => Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextAction(
                              child:
                                  Text("Anuluj", style: textTheme.titleMedium),
                              onTap: () {
                                Navigator.pop(context);
                              },
                            ),
                            TextAction(
                              child: Text("Git", style: textTheme.titleMedium),
                              onTap: () {
                                ref.read(selectedTagsProvider.notifier).state = [...selected];
                                Navigator.pop(context);
                              },
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        ChoteTextField(
                          icon: const Icon(Icons.search),
                          placeholder: "Szukaj",
                          controller: controller,
                        ),
                        Expanded(child:
                            StatefulBuilder(builder: (context, setState) {
                          return ListView.builder(
                            itemCount: items.length,
                            itemBuilder: (context, index) {
                              final item = items[index];
                              final isSelected = selected.contains(item);
                              return CheckboxListTile(
                                  title: Text(item),
                                  value: isSelected,
                                  onChanged: (_) {
                                    if (isSelected) {
                                      selected.remove(item);
                                    } else {
                                      selected.add(item);
                                    }
                                    setState(() {});
                                  });
                            },
                          );
                        }))
                      ],
                    ),
                  ));
        });
  }
}



class TextAction extends StatelessWidget {
  const TextAction({super.key, this.onTap, this.child});

  final void Function()? onTap;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 2.0),
        child: Center(child: child),
      ),
    );
  }
}
