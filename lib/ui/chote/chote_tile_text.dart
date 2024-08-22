import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jot_notes/config/colors.dart';
import 'package:jot_notes/ui/chote/chote_tile.dart';

class ChoteTileText extends ConsumerWidget {
  const ChoteTileText({super.key});

  void _showFullText(BuildContext context, String text, shouldOpen) {
    if (shouldOpen) {
      Navigator.push(context,
          MaterialPageRoute(builder: (_) => ChoteTileFullTextModal(text)));
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final chote = ref.watch(currentChoteProvider);

    const maxLength = 800;

    final isLong = chote.text.length > maxLength + 200;
    final excerpt = isLong ? chote.text.substring(0, maxLength) : null;

    return Material(
      child: InkWell(
        onTap: () => _showFullText(context, chote.text, isLong),
        child: Ink(
          decoration: BoxDecoration(
              color: AacColors.primary,
              borderRadius: BorderRadius.circular(6.0)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 300),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Flexible(
                    child: Text.rich(
                      TextSpan(children: [
                        TextSpan(text: excerpt ?? chote.text),
                        if (isLong)
                          const TextSpan(
                              text: "... Czytaj więcej",
                              style: TextStyle(fontWeight: FontWeight.bold))
                      ]),
                      softWrap: true,
                      style: const TextStyle(
                          color: AacColors.white, fontSize: 12.0, height: 1.5),
                    ),
                  ),
                  const SizedBox(
                    width: 8.0,
                  ),
                  Text(chote.createdTime,
                      style: const TextStyle(
                          color: AacColors.afterThought,
                          fontSize: 8.0,
                          height: 1.5)),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ChoteTileFullTextModal extends StatelessWidget {
  const ChoteTileFullTextModal(this.text, {super.key});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Ink(
            decoration: BoxDecoration(
                color: AacColors.primary,
                borderRadius: BorderRadius.circular(6.0)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                text,
                softWrap: true,
                style: const TextStyle(
                    color: AacColors.white, fontSize: 12.0, height: 1.5),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
