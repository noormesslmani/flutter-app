import 'package:flutter/material.dart';

class ChatButton extends StatelessWidget {
  final void Function()? onPressed;
  const ChatButton({required this.onPressed, super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      heroTag: 'chat',
      onPressed: onPressed,
      child: const Icon(
        Icons.chat_bubble,
        size: 26,
      ),
    );
  }
}
