
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context){
    const title = 'Cutomize Input Filed';
    return MaterialApp(
      title: title,
      home: Scaffold(
        appBar: AppBar(title: Text(title),),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8), child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter a search term',
              ),  
            ),),
            Padding(padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8), child: TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter a search term',
              ),  
            ),
            )
          ],
        ),
      ),
    );
  }
}