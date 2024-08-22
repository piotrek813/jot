import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jot_notes/service/auth_service.dart/auth_service.dart';
import 'package:sign_in_button/sign_in_button.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Center(
          child: SignInButton(
        Buttons.google,
        onPressed: () => ref.watch(authServiceProvider).singInWithGoogle(),
      )),
    ]));
  }
}
