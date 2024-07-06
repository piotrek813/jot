import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notes/ui/appbar.dart';
import 'package:notes/ui/chote/chotes_list.dart';
import 'package:notes/ui/form/chote_additional_actions.dart';
import 'package:notes/ui/form/form.dart';

import 'config/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Notes',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0x00676df4)),
        useMaterial3: true,
      ),
      home: const NotesChat(),
    );
  }
}

class NotesChat extends StatelessWidget {
  const NotesChat({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: ChatAppBar(),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(child: ChotesList()),
            ChotePickedFiles(),
            ChatForm(),
            ChoteAdditionalActions(),
          ],
        ),
      ),
    );
  }
}
