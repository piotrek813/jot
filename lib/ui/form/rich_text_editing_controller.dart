// import 'package:flutter/material.dart';
//
// class RichTextFieldController extends TextEditingController {
//   late final Pattern pattern;
//   String pureText = '';
//   final Map<String, TextStyle> map = {
//     r'@.\w+': const TextStyle(color: Colors.blue),
//     r'#.\w+': const TextStyle(color: Colors.blue),
//     r'\*\*(.*?)\*\*': const TextStyle(fontWeight: FontWeight.bold),
//     r'\*(.*?)\*': const TextStyle(fontStyle: FontStyle.italic),
//     '~~(.*?)~~': const TextStyle(decoration: TextDecoration.lineThrough),
//   };
//
//   RichTextFieldController({super.text}) {
//     pattern = RegExp(map.keys.map((key) => key).join('|'), multiLine: true);
//   }
//
//   @override
//   set text(String newText) {
//     value = value.copyWith(
//       text: newText,
//       selection: TextSelection.collapsed(offset: newText.length),
//       composing: TextRange.empty,
//     );
//   }
//
//   @override
//   TextSpan buildTextSpan({
//     required context,
//     TextStyle? style,
//     required bool withComposing,
//   }) {
//     final List<InlineSpan> children = [];
//
//     for (final MapEntry(:key, :value) in map.entries) {}
//
//     text.splitMapJoin(pattern, onMatch: (match) {
//       print(match.group(group));
//       return "";
//     }, onNonMatch: (match) {
//       print(match);
//
//       return "";
//     });
//
//     return TextSpan(style: style, children: children);
//   }
// }
