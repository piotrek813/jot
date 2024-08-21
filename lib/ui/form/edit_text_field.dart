import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jot/model/chote.dart';
import 'package:jot/service/chote_service.dart';
import 'package:jot/ui/form/form.dart';

final editedChoteProvider = StateProvider<Chote?>((_) => null);

class ChoteEditTextField extends ConsumerStatefulWidget {
  const ChoteEditTextField({super.key});

  @override
  ConsumerState<ChoteEditTextField> createState() => _ChoteEditTextFieldState();
}

class _ChoteEditTextFieldState extends ConsumerState<ChoteEditTextField> {
  late TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
            onPressed: () =>
                ref.read(editedChoteProvider.notifier).state = null,
            icon: const Icon(Icons.cancel_rounded)),
        Expanded(child: ChoteTextField(controller: controller)),
        IconButton(
            onPressed: () {
              ref.read(choteServiceProvider).add(ref
                  .read(editedChoteProvider)!
                  .copyWith(text: controller.text));

              ref.read(editedChoteProvider.notifier).state = null;
            },
            icon: const Icon(Icons.check_rounded))
      ],
    );
  }

  @override
  void initState() {
    super.initState();

    controller =
        TextEditingController(text: ref.read(editedChoteProvider)?.text);
  }
}
