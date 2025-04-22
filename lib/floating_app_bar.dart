import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({
    super.key
  });

  @override
  Widget build(BuildContext context){
    const title = 'Floating App Bar';
    return MaterialApp(
      title: title,
      home: Scaffold(
        body: CustomScrollView(
          slivers: [
            const SliverAppBar(
              title: Text(title),
              pinned: true,
              flexibleSpace: Placeholder(),
              expandedHeight: 200,
            ),
            SliverList.builder(
               itemBuilder: (context, index) => ListTile(
                title: Text('items $index'),
               ),
               itemCount: 50,
            ),
          ],
        )  
      ),
    );
  }
}