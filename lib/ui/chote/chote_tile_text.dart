import 'dart:developer';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jot_notes/config/colors.dart';
import 'package:jot_notes/ui/chote/chote_tile.dart';
import 'package:url_launcher/url_launcher.dart';

const _textStyle =
    TextStyle(color: AacColors.white, fontSize: 14.0, height: 1.5);

class ChoteText extends StatelessWidget {
  final String text;
  final List<InlineSpan>? children;
  const ChoteText(this.text, {super.key, this.children});

  void openUrl(Uri url) async {
    try {
      if (!url.isScheme("HTTPS")) {
        url = Uri.parse("https://$url");
      }

      if ((await canLaunchUrl(url))) {
        launchUrl(url, mode: LaunchMode.externalApplication);
      }
    } catch (_) {
      log("Something went wrong, couldn't launch url");
    }
  }

  @override
  Widget build(BuildContext context) {
    final linkRegex = RegExp(
        r"(https?:\/\/(www\.)?)?[-a-zA-Z0-9@:%.,_\+~#=]{1,256}\.[a-zA-Z0-9()]{1,6}\b([-a-zA-Z0-9()@:%_\,+.~#?&\/\/=]*)");
    final links = linkRegex.allMatches(text);

    final List<InlineSpan> textSpans = [];
    if (links.isEmpty) {
      textSpans.add(TextSpan(text: text));
    }

    int lastIndex = 0;
    List<String> textParts = [];

    // Split the text keeping URLs
    for (final match in links) {
      if (match.start > lastIndex) {
        textParts.add(text.substring(lastIndex, match.start));
      }
      textParts.add(match.group(0)!); // Add the URL itself
      lastIndex = match.end;
    }

    if (lastIndex < text.length) {
      textParts.add(text.substring(lastIndex));
    }

    for (final s in textParts) {
      if (linkRegex.hasMatch(s)) {
        textSpans.add(TextSpan(
            text: s,
            style: const TextStyle(
                decoration: TextDecoration.underline,
                decorationColor: AacColors.white),
            recognizer: TapGestureRecognizer()
              ..onTap = () => openUrl(Uri.parse(s))));

        continue;
      }
      textSpans.add(TextSpan(text: s));
    }
    return Text.rich(
      TextSpan(children: [...textSpans, ...?children]),
      style: _textStyle,
    );
  }
}

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

    const maxLength = 300;

    final isLong = chote.text.length > maxLength + 200;
    final excerpt = isLong ? chote.text.substring(0, maxLength) : null;

    final text = excerpt ?? chote.text;

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
                      child: ChoteText(
                    text,
                    children: [
                      if (isLong)
                        const TextSpan(
                            text: "... Czytaj więcej",
                            style: TextStyle(fontWeight: FontWeight.bold))
                    ],
                  )),
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
                padding: const EdgeInsets.all(8.0), child: ChoteText(text)),
          ),
        ),
      ),
    );
  }
}
