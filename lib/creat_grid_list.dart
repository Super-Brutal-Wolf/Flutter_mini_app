import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp(
    {
      super.key,
    }
  );
  @override
  Widget build(BuildContext context){
    const String title='GridView Example';
    return 
      MaterialApp(
        title: title,
        home: Scaffold(
          appBar: AppBar(title: const Text(title)),
          body: 
            GridView.count(
            crossAxisCount: 2,
            children: List.generate(100, (index){
              return Center(child: 
              Text(
                'Index $index',
                 style: TextTheme.of(context).headlineSmall,
                ),
              );
            }
            )
            )
      ),
    );
  }
}