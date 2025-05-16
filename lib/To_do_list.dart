import 'package:flutter/material.dart';

class Todo {
  final String title;
  final String description;

  const Todo(this.title, this.description);
}

void main() {
  runApp(
    MaterialApp(
      title: 'To Do List Demo',
      home: ToDoScreen(
        todolist: List.generate(
          20,
          (i) => Todo('Todo $i', 'Description for what needs to be done $i'),
        ),
      ),
    ),
  );
}

class ToDoScreen extends StatelessWidget {
  const ToDoScreen({super.key, required this.todolist});

  final List<Todo> todolist;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('To Do List Demo')),
      body: ListView.builder(
        itemCount: todolist.length,
        itemBuilder:
            (context, index) => ListTile(
              title: Text(todolist[index].title),
              onTap:
                  () => {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => DetailScreen(), settings: RouteSettings(arguments: todolist[index])),
                    ),
                  },
            ),
      ),
    );
  }
}

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key,});

  @override
  Widget build(BuildContext context) {
    final todo = ModalRoute.of(context)!.settings.arguments as Todo;
    return Scaffold(
      appBar: AppBar(title: Text(todo.title)),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Text(todo.description),
      ),
    );
  }
}
