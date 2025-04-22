import 'package:flutter/material.dart';

void main () => runApp(MyApp());

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context){
    const title = 'Swip To Delete Demo';
    return MaterialApp(
      title: title,
      theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple)),
      home: Scaffold(
        appBar: AppBar(title: Text(title),),
        body: MyBodyPage(),
      ),
    );
  }
}


class MyBodyPage extends StatefulWidget{
  const MyBodyPage({super.key});
  @override
  State<MyBodyPage> createState()=> _MyBodyPageState();
}

class _MyBodyPageState extends State<MyBodyPage>{
  final items = List<String>.generate(20, (i)=> 'Item ${i+1}');

  @override
  Widget build(BuildContext context){
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        return Dismissible(
          key: Key(item),
          background: Container(color: Colors.red[500],),
          onDismissed:(direction) {
            setState(() {
              items.removeAt(index);
            });
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('$item dismissed')));
          }, 
          child: ListTile(title: Text(item),),
        );
      }
    );
  }
}