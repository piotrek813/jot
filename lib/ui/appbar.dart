import 'package:flutter/material.dart';

class ChatAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ChatAppBar({super.key});

  @override
  final Size preferredSize = const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: const CircleAvatar(
        backgroundImage: AssetImage('assets/camus.jpg'),
      ),
      title: const Text("Moje notatki"),
      actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.image))],
    );
  }
}
