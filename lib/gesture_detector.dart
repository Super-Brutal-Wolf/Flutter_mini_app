
import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context){
    String title = 'Gesture Demo';
    return MaterialApp(
      title: title,
      home: MyHomePage(title: title),
    );
  }
}

class MyHomePage extends StatelessWidget{
  const MyHomePage({
    super.key,
    required this.title,
  });

  final String title;
  
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text(title),),
      body: const Center(child: MyButton(),),
    );
  }
}

class MyButton extends StatelessWidget{
  const MyButton({super.key});

  @override
  Widget build(BuildContext context){
    return GestureDetector(
        onTap: () {
          const snackBar = SnackBar(content: Text('Tap'));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        },

        child: Container(
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.lightBlue,
            borderRadius: BorderRadius.circular(5),
          ),
          child: const Text('My Button'),
        ),


    );
  }
}