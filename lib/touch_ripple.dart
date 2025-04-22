
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context){
    const title = 'InkWell Demo';
    return MaterialApp(
      title: title,
      home: MyHomePage(title: title),
    );
  }
}

class MyHomePage extends StatelessWidget{
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context){
    return Scaffold(
       appBar: AppBar
       (
        title: Text(title),
       ),
       body: const Center(child: MyButton(),)
    );
  }
}

class MyButton extends StatelessWidget{
  const MyButton({super.key});
  @override
  Widget build(BuildContext context){
    return InkWell(
      onTap: () {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('InkWell Demo')));
      },

      child: Padding(padding: EdgeInsets.symmetric(horizontal: 12), child: Text('Flat Button'),),
    );
  }
}