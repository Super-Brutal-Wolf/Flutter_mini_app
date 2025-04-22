import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const title = 'Handle Change';
    return MaterialApp(title: title, home: MyCustomForm());
  }
}

class MyCustomForm extends StatefulWidget {
  const MyCustomForm({super.key});

  @override
  State<MyCustomForm> createState() => _MyCustomFormState();
}

class _MyCustomFormState extends State<MyCustomForm> {
  final myController = TextEditingController();


  late FocusNode myFocusNode; 

  @override
  void initState() {
    super.initState();
    myFocusNode = FocusNode();
  }
  @override
  void dispose() {
    super.dispose();
    myFocusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Handle Change')),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: Column(
          children: [
            TextField(
              focusNode: myFocusNode,
              controller: myController,
              decoration: InputDecoration(border: OutlineInputBorder()),
            ),
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(onPressed: myFocusNode.requestFocus,
      tooltip: 'Focus Input',
      child: Icon(Icons.edit),
      ),
    );
  }
}
