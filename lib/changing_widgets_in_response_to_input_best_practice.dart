import 'package:flutter/material.dart';

class CounterDisplay extends StatelessWidget{
  const CounterDisplay({super.key, required this.counter});

  final int counter;

  @override
  Widget build(BuildContext context){
    return Text('Counter: $counter');
  }
}

class CounterIncremet extends StatelessWidget{
  const CounterIncremet({super.key, required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context){
    return ElevatedButton(onPressed: onPressed, child: const Text('Increment'));
  }
}


class _CounterState extends State<Counter>{
  int _counter = 0;
  void _increment(){
    setState(() {
      _counter++;
    });
  }
  @override
  Widget build(BuildContext context){
    return Row(
      children: <Widget>[
        CounterIncremet(onPressed: _increment),
        const SizedBox(width: 8,),
        CounterDisplay(counter: _counter)
      ],
    ); 
  }
}

class Counter extends StatefulWidget{
  const Counter({super.key});

  @override
  State<Counter> createState() => _CounterState();
}



void main() {
  runApp(const MaterialApp (home: Scaffold(body: Center(child: Counter()))));
}