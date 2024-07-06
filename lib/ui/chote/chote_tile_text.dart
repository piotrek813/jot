import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notes/config/colors.dart';
import 'package:notes/ui/chote/chote_tile.dart';

class ChoteTileText extends ConsumerWidget {
  const ChoteTileText({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final chote = ref.watch(currentChoteProvider);
    return Material(
      child: Ink(
        decoration: BoxDecoration(
            color: AacColors.primary, borderRadius: BorderRadius.circular(6.0)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                chote.text,
                style: const TextStyle(
                    color: AacColors.white, fontSize: 12.0, height: 1.5),
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
    );
  }
}
