import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jot_notes/ui/form/form.dart';
import 'package:jot_notes/ui/search/search_screen.dart';
import 'package:jot_notes/utils/debounce.dart';

class SearchAppBar extends ConsumerStatefulWidget
    implements PreferredSizeWidget {
  const SearchAppBar({
    super.key,
  });

  @override
  ConsumerState<SearchAppBar> createState() => _SearchAppBarState();

  @override
  final Size preferredSize = const Size.fromHeight(kToolbarHeight);
}

class _SearchAppBarState extends ConsumerState<SearchAppBar> {
  final controller = TextEditingController();
  final _debounce = Debouncer(const Duration(milliseconds: 300));
  final focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    focusNode.requestFocus();
  }

  @override
  void dispose() {
    super.dispose();
    _debounce.dispose();
    controller.dispose();
    focusNode.dispose();
  }

  void clearOrPop() {
    if (controller.text.isEmpty) {
      Navigator.pop(context);
      return;
    }

    controller.clear();
  }

  @override
  Widget build(BuildContext context) {

    return AppBar(
      automaticallyImplyLeading: false,
      title: ChoteTextField(
            focusNode: focusNode,
            placeholder: "Szukaj",
            controller: controller,
            onChanged: (value) =>
                ref.read(queryProvider.notifier).state = value,
            suffixIcon: IconButton(
                onPressed: clearOrPop, icon: const Icon(Icons.cancel)),
          ),
        );
  }
}

