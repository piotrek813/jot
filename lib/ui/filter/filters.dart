import 'package:flutter/material.dart';
import 'package:jot_notes/ui/filter/tag_filter.dart';

class Filters extends StatelessWidget {
  const Filters({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [TagFilter()],
    );
  }
}


