import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jot_notes/config/colors.dart';
import 'package:jot_notes/service/chote_service.dart';
import 'package:jot_notes/service/file_service.dart';
import 'package:jot_notes/ui/form/chote_additional_actions.dart';
import 'package:jot_notes/ui/form/edit_text_field.dart';
import 'package:rich_text_controller/rich_text_controller.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'form.g.dart';

typedef FormDisabledMap = Map<String, bool>;

extension on FormDisabledMap {
  bool get disabled => values.fold(true, (prev, val) => prev && val);
}

@Riverpod(dependencies: [ChoteFilePicker])
class IsFormDisabled extends _$IsFormDisabled {
  @override
  FormDisabledMap build() {
    ref.listen(choteFilePickerProvider,
        (_, curr) => condition('files-picked', curr.isEmpty));

    return {};
  }

  void condition(String name, bool b) {
    final newState = {...state};
    newState[name] = b;
    state = newState;
  }
}

class ChatForm extends ConsumerStatefulWidget {
  const ChatForm({super.key});

  @override
  ConsumerState<ChatForm> createState() => _ChatFormState();
}

class _ChatFormState extends ConsumerState<ChatForm> {
  final formKey = GlobalKey<FormState>();
  late final RichTextController choteController;
  @override
  void initState() {
    super.initState();

    choteController = RichTextController(onMatch: (_) {}, targetMatches: [
      MatchTargetItem(
          allowInlineMatching: true,
          style: const TextStyle(
            color: Colors.blue,
          ),
          regex: RegExp(r'(#\S+)'))
    ]);

    choteController.addListener(() {
      ref
          .read(isFormDisabledProvider.notifier)
          .condition('text-field', choteController.text.trim().isEmpty);
    });
  }

  @override
  void dispose() {
    super.dispose();

    choteController.dispose();
  }

  void submit() {
    if (formKey.currentState == null) return;
    if (!formKey.currentState!.validate()) return;
    if (ref.read(isFormDisabledProvider).disabled) return;

    ref.read(choteServiceProvider).create(
        text: choteController.text, files: ref.read(choteFilePickerProvider));
    ref.read(choteFilePickerProvider.notifier).clear();
    choteController.clear();
  }

  @override
  Widget build(BuildContext context) {
    final editedChote = ref.watch(editedChoteProvider);
    final isFormDisabled = ref.watch(isFormDisabledProvider).disabled;
    if (editedChote != null) return const ChoteEditTextField();

    return Form(
        key: formKey,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Expanded(
                child: ChoteTextField(
              suffixIcon: !isFormDisabled
                  ? const ChoteAdditionalActionsButton(
                      onDark: false,
                    )
                  : null,
              onTap: () =>
                  ref.read(showAdditionalActionsProvider.notifier).hide(),
              controller: choteController,
            )),
            const SizedBox(width: 8.0,),
            ChoteActionButton(submit: submit, disabled: isFormDisabled),
          ],
        ));
  }
}

class ChoteSubmitButton extends StatelessWidget {
  const ChoteSubmitButton({required this.submit, super.key});
  final Function() submit;

  @override
  Widget build(BuildContext context) {
    return IconButton(
        color: AacColors.white,
        onPressed: submit,
        icon: const Icon(Icons.send_rounded));
  }
}

class ChoteAdditionalActionsButton extends ConsumerWidget {
  const ChoteAdditionalActionsButton({super.key, required this.onDark});

  final bool onDark;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return IconButton(
        color: onDark ? AacColors.white : null,
        onPressed: () {
          ref.read(showAdditionalActionsProvider.notifier).toggle();

          // hides keyboard
          FocusManager.instance.primaryFocus?.unfocus();
        },
        icon: const Icon(Icons.add));
  }
}

class ChoteActionButton extends ConsumerWidget {
  const ChoteActionButton(
      {super.key, required this.submit, this.disabled = false});

  final Function() submit;
  final bool disabled;

  void onPressed(WidgetRef ref) {
    if (disabled) {
      ref.read(showAdditionalActionsProvider.notifier).toggle();

      // hides keyboard
      FocusManager.instance.primaryFocus?.unfocus();
      return;
    }

    submit();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Ink(
        decoration: const ShapeDecoration(
            shape: CircleBorder(), color: AacColors.primary),
        child: disabled
            ? const ChoteAdditionalActionsButton(
                onDark: true,
              )
            : ChoteSubmitButton(submit: submit));
  }
}

class ChoteTextField extends StatelessWidget {
  final String placeholder;

  final Widget? icon;
  final Widget? suffixIcon;
  final TextEditingController? controller;
  final void Function(String)? onChanged;
  final void Function()? onTap;
  final void Function()? onEditingComplete;
  final String? errorText;
  final FormFieldValidator<String>? validator;
  final bool readOnly;
  final FocusNode? focusNode;
  const ChoteTextField(
      {super.key,
      this.placeholder = "Notatka",
      this.icon,
      this.readOnly = false,
      this.focusNode,
      this.suffixIcon,
      this.controller,
      this.onTap,
      this.onEditingComplete,
      this.onChanged,
      this.errorText,
      this.validator});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: readOnly,
      focusNode: focusNode,
      style: const TextStyle(fontSize: 16),
      onTap: onTap,
      controller: controller,
      validator: validator,
      onChanged: onChanged,
      onEditingComplete: onEditingComplete,
      maxLines: null,
      decoration: InputDecoration(
        fillColor: const Color(0xFFF4F2F2),
        filled: true,
        hintText: placeholder,
        prefixIcon: icon,
        suffixIcon: suffixIcon,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 12, vertical: 11),
        errorText: errorText,
        border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(4)),
            borderSide: BorderSide.none),
      ),
    );
  }
}

class ChotePickedFiles extends ConsumerWidget {
  const ChotePickedFiles({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final files = ref.watch(choteFilePickerProvider);
    return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(children: files.map(ChoteFilePreview.new).toList()));
  }
}

class ChoteFilePreview extends ConsumerWidget {
  const ChoteFilePreview(this.path, {super.key});

  final String path;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Stack(alignment: AlignmentDirectional.topEnd, children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(6.0),
          child: Image.file(
            File(path),
            width: 100,
            height: 100,
            fit: BoxFit.cover,
          ),
        ),
      ),
      IconButton(
          onPressed: () =>
              ref.read(choteFilePickerProvider.notifier).removeFile(path),
          icon: const Icon(Icons.cancel_rounded)),
    ]);
  }
}
