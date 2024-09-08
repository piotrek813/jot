import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jot_notes/config/colors.dart';
import 'package:jot_notes/service/link_preview_service.dart';
import 'package:jot_notes/ui/chote/chote_tile_text.dart';

class ChoteLinkPreview extends ConsumerWidget {
  final String link;

  const ChoteLinkPreview(this.link, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final preview = ref.watch(linkPreviewProvider(link)).valueOrNull;

    if (preview == null) return const SizedBox();

final hasImage = preview.image.isNotEmpty;
    return GestureDetector(
      onTap: () => openUrl(Uri.parse(link)),
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: Row(
          crossAxisAlignment: hasImage ? CrossAxisAlignment.stretch : CrossAxisAlignment.start,
          children: [
            if (hasImage)
              Flexible(
                flex: 1,
                child: Container(
                  color: AacColors.afterThought,
                  width: double.infinity,
                  child: Image.network(
                    preview.image,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            const SizedBox(
              width: 4,
            ),
            Flexible(
              flex: 2,
              child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(preview.title,
                      style: Theme.of(context).textTheme.titleSmall),
                  const SizedBox(height: 4),
                  Text(
                    preview.description.length > 80
                        ? "${preview.description.substring(0, 80)}..."
                        : preview.description,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
