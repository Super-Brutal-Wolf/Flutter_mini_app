import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(title: 'Return Data from Screen', home: MyHomePage()));
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Returning Data Demo')),
      body: const Center(child: SelectButton()),
    );
  }
}

class SelectButton extends StatefulWidget {
  const SelectButton({super.key});

  @override
  State<SelectButton> createState() => _SelectButtonState();
}

class _SelectButtonState extends State<SelectButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        _navigatorFunction(context);
      },
      child: Text('Pick an option, any option!'),
    );
  }
}

Future<void> _navigatorFunction(BuildContext context) async {
  final result = await Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => SelectScreen()),
  );
  if (!context.mounted) return;
  ScaffoldMessenger.of(context)
    ..removeCurrentSnackBar()
    ..showSnackBar(SnackBar(content: Text('$result')));
}

class SelectScreen extends StatelessWidget {
  const SelectScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Pick an option')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.all(8),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context, 'Yep!');
                },
                child: Text('Yep!'),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context, 'Nope!');
                },
                child: Text('Nope!'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
