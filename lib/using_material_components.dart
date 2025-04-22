import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      title: 'My First App',
      home: TutorialHome()
    )
  );
}

class TutorialHome extends StatelessWidget {
  const TutorialHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(icon: Icon(Icons.menu), tooltip: "Navigation Menu", onPressed: null,),
        title: const Text('Example title'),
        actions: const [
          IconButton(icon: Icon(Icons.search), tooltip: "Search", onPressed: null,)
        ]
      ),
      body: const Center(child: Text('Hello World'),),
      floatingActionButton: const FloatingActionButton(tooltip:'Add', onPressed: null, child: Icon(Icons.add)),
    );
  }
}

