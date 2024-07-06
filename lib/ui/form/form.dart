import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notes/config/colors.dart';
import 'package:notes/model/chote.dart';
import 'package:notes/service/chote_service.dart';
import 'package:notes/service/file_service.dart';
import 'package:notes/ui/form/chote_additional_actions.dart';
import 'package:notes/ui/form/edit_text_field.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'form.g.dart';

@Riverpod(dependencies: [ChoteFilePicker])
class IsFormDisabled extends _$IsFormDisabled {
  @override
  bool build() {
    return true;
  }

  void and(bool b) {
    state = b || ref.read(choteFilePickerProvider).isEmpty;
  }
}

class ChatForm extends ConsumerStatefulWidget {
  const ChatForm({super.key});

  @override
  ConsumerState<ChatForm> createState() => _ChatFormState();
}

class _ChatFormState extends ConsumerState<ChatForm> {
  final formKey = GlobalKey<FormState>();

  final choteController = TextEditingController();

  @override
  void initState() {
    super.initState();

    choteController.addListener(() {
      setState(() {
        ref
            .read(isFormDisabledProvider.notifier)
            .and(choteController.text.trim().isEmpty);
      });
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
    if (ref.read(isFormDisabledProvider)) return;

    final chote = Chote(
        text: choteController.text, files: ref.read(choteFilePickerProvider));
    ref.read(choteServiceProvider).add(chote);
    ref.read(choteFilePickerProvider.notifier).clear();
    choteController.clear();
  }

  @override
  Widget build(BuildContext context) {
    final editedChote = ref.watch(editedChoteProvider);

    if (editedChote != null) return const ChoteEditTextField();

    return Form(
        key: formKey,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Expanded(
                child: ChoteTextField(
              onTap: () =>
                  ref.read(showAdditionalActionsProvider.notifier).hide(),
              controller: choteController,
            )),
            ChoteActionButton(
                submit: submit, disabled: ref.watch(isFormDisabledProvider)),
          ],
        ));
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
        child: IconButton(
            color: AacColors.white,
            onPressed: () => onPressed(ref),
            icon: Icon(disabled ? Icons.add : Icons.send_rounded)));
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
