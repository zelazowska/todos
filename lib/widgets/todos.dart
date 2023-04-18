import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:knam_example/widgets/todo_tile.dart';

/// Displays a text field and a button for adding a todo with text from text
/// field. Todos are removable. Todos are displayed sorted by creation, with
/// newest being higher. You can change the order of todos. You cannot create
/// a todo with empty text and if you try user is informed in a proper way.
class Todos extends HookWidget {
  const Todos({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = useTextEditingController();
    final todos = useState(<String>[]);

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
                    todos.value = [...todos.value..insert(0, controller.text)];
                    controller.clear(); // ... spread operator
                  },
                ),
              ],
            ),
            const SizedBox(height: 16),
            Expanded(
              // TODO 6

              child: ReorderableListView(
                onReorder: (oldIndex, newIndex) {
                  if (oldIndex < newIndex) {
                    newIndex -= 1;
                  }

                  final todoList = todos.value;
                  final todo = todoList.removeAt(oldIndex);
                  todoList.insert(newIndex, todo);
                  todos.value = [...todoList];
                },
                children: todos.value // TODO 3
                    .map((todo) => TodoTile(
                          // TODO 2
                          key: UniqueKey(),
                          text: todo,
                          onRemove: () {
                            final todoList = todos.value;
                            todoList.remove(todo);
                            todos.value = [...todoList];
                          },
                        ))
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
