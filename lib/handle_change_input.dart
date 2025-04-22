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

  @override
  void initState() {
    myController.addListener(_printLastView);
    super.initState();
  }

  void _printLastView() {
    final text = myController.text;
    print('First Field: $Text \'s length is ${text.characters.length}');
  }

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
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
              controller: myController,
              decoration: InputDecoration(border: OutlineInputBorder()),
            ),
            TextField(
              decoration: InputDecoration(border: UnderlineInputBorder()),
              onChanged: (text) {
                print(
                  'Second Field: $text \'s length is ${text.characters.length}',
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
