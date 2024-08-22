import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jot_notes/login_screen.dart';
import 'package:jot_notes/service/auth_service.dart/auth_service.dart';
import 'package:jot_notes/ui/appbar.dart';
import 'package:jot_notes/ui/chote/chote_tile.dart';
import 'package:jot_notes/ui/chote/chotes_list.dart';
import 'package:jot_notes/ui/form/chote_additional_actions.dart';
import 'package:jot_notes/ui/form/form.dart';

import 'config/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isAuthenticated = ref.watch(authStateChangesProvider);
    return MaterialApp(
        title: 'Notes',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: const Color(0x00676df4)),
          useMaterial3: true,
        ),
        home: isAuthenticated.when(
            data: (user) {
              if (user != null) {
                return const NotesChat();
              } else {
                return const LoginScreen();
              }
            },
            error: (_, __) => const Placeholder(),
            loading: () => const Placeholder()));
  }
}

class NotesChat extends ConsumerWidget {
  const NotesChat({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: ref.watch(areChotesSelectedProvider)
          ? const SelectOptionsdAppBar()
          : const ChatAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Expanded(child: ChotesList()),
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const ChotePickedFiles(),
                ConstrainedBox(
                    constraints: const BoxConstraints(maxHeight: 200),
                    child: const ChatForm()),
              ],
            ),
            const ChoteAdditionalActions(),
          ],
        ),
      ),
    );
  }
}
