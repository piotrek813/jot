import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:jot/service/auth_service.dart/auth_service.dart';
import 'package:jot/ui/appbar.dart';
import 'package:jot/ui/chote/chotes_list.dart';
import 'package:jot/ui/form/chote_additional_actions.dart';
import 'package:jot/ui/form/form.dart';

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
    final bool isAuthenticated = ref.watch(isAuthenticatedProvider);
    return MaterialApp(
        title: 'Notes',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: const Color(0x00676df4)),
          useMaterial3: true,
        ),
        home: isAuthenticated ? const NotesChat() : const LoginScreen());
  }
}

class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: SignInButton(Buttons.Google,
              onPressed: () =>
                  ref.watch(authServiceProvider).singInWithGoogle()),
        ),
      ],
    ));
  }
}

class NotesChat extends StatelessWidget {
  const NotesChat({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ChatAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Expanded(child: ChotesList()),
            const ChotePickedFiles(),
            ConstrainedBox(
                constraints: const BoxConstraints(maxHeight: 200),
                child: const ChatForm()),
            const ChoteAdditionalActions(),
          ],
        ),
      ),
    );
  }
}
