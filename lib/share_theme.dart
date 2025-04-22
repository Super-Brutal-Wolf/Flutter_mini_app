
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({
    super.key
  });

  @override
  Widget build(BuildContext context){
    
    const appName = 'Custome Theme';
    return MaterialApp(
      title: appName,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.purple, brightness: Brightness.dark),
        textTheme: TextTheme(
          titleLarge: GoogleFonts.oswald(
            fontSize: 72,
            fontWeight: FontWeight.bold
          ),
          bodyMedium: GoogleFonts.merriweather()
        ),
      ),
      home: const MyHomePage(title: appName)
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
      appBar: AppBar(
        title: Text(title,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(color: Theme.of(context).colorScheme.onSecondary),
        ),
        backgroundColor: Theme.of(context).colorScheme.secondary,
      ),

      body: Center(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          color: Theme.of(context).colorScheme.primary,
          child: Text(
            'Text with a background color',
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Theme.of(context).colorScheme.onPrimary),
            ),
         ),
        ),

      floatingActionButton: Theme(data: Theme.of(context).copyWith(colorScheme: ColorScheme.fromSeed(seedColor: Colors.pink)), 
                                  child: FloatingActionButton(onPressed: () {}, child: Icon(Icons.add) ,)),

    );
  }

}