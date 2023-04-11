import 'dart:ffi';

import 'package:flutter/material.dart';

// TODO: 5. we should be able to remove a todo so we need to call removeTodo here
class TodoTile extends StatelessWidget {
  const TodoTile({super.key, required this.text, required this.onRemove});

  final String text;
  final VoidCallback onRemove;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
        key: UniqueKey(),
        direction: DismissDirection.endToStart,
        onDismissed: (_) {
          onRemove();
        }, 
        background: const ColoredBox(color: Colors.red),
        // add confirmation - do you want to do it?
      child: ListTile(
        title: Text(
          text,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 24,
          ),
        ),
      ),
    );
  }
}
