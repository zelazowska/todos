import 'package:flutter/material.dart';
import 'package:knam_example/widgets/todo_tile.dart';

/// Displays a text field and a button for adding a todo with text from text
/// field. Todos are removable. Todos are displayed sorted by creation, with
/// newest being higher. You can change the order of todos. You cannot create
/// a todo with empty text and if you try user is informed in a proper way.
class Todos extends StatefulWidget {
  const Todos({super.key});

  @override
  State createState() => _TodosState();
}

class _TodosState extends State<Todos> {
  final controller = TextEditingController();
  final todos = <String>[];

  void addTodo(String todo) {
    setState(() {
      // TODO 1
      todos.add(todo); //or todos.add(controller.text)
    });
    controller.clear();
  }

  void removeTodo(String todo) {
    setState(() {
      // TODO 4
      todos.remove(todo);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        minimum: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: controller,
                    autocorrect: false,
                    maxLines: 1,
                    style: const TextStyle(fontSize: 28),
                    textAlignVertical: TextAlignVertical.top,
                    cursorColor: Colors.black,
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.symmetric(horizontal: 8),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                IconButton(
                  icon: const Icon(Icons.add),
                  color: Colors.black,
                  onPressed: () {
                    addTodo(controller
                        .text); //would work as addTodo if we state todos.add(controller.text)
                    // TODO 1 controller.clear(); would also work here but
                    // but we aim for minimal code in build
                  },
                ),
              ],
            ),
            const SizedBox(height: 16),
            Expanded(
              // TODO: 6. we should be able to change order of todos
              child: SingleChildScrollView(
                child: Column(
                  children: todos
                      // TODO 3
                      .reversed
                      .map((todo) => TodoTile(
                            // TODO 2
                            text: todo,
                            onRemove: () {
                              removeTodo(todo);
                            },
                          ))
                      .toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
