
import 'package:flutter/material.dart';

abstract class ListItem{
  Widget buildTitle(BuildContext context);
  Widget buildSubTitle(BuildContext context);
}

class HeadingItem implements ListItem{
  final String heading;
  HeadingItem(this.heading);

  @override
  Widget buildTitle(BuildContext context){
    return Text(
      heading,
      style: Theme.of(context).textTheme.headlineSmall
    );
  }

  @override
  Widget buildSubTitle(BuildContext context) => const SizedBox.shrink();
}

class MessageItem implements ListItem{
  final String sender;
  final String message;

  MessageItem(this.sender, this.message);

  @override
  Widget buildTitle(BuildContext context) => Text(sender);
  
  @override
  Widget buildSubTitle(BuildContext context) => Text(message);
}

void main(){
  runApp(MyApp(
    items: List<ListItem>.generate(
      1000,
      (i) => 
      i % 6 ==0 ? HeadingItem('Heading $i') : MessageItem('Sender $i', 'Message $i')
    )
  ));
}

class MyApp extends StatelessWidget{
  final List<ListItem> items;
  const MyApp({
    super.key,
    required  this.items
  });

  
  @override
  Widget build(BuildContext context){
    const title = 'Mixed Items';
    return MaterialApp(
      title: title,
      home: Scaffold(
        appBar: AppBar(title: const Text(title)),
        body: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            final item = items[index];
            return ListTile(
              title: item.buildTitle(context),
              subtitle: item.buildSubTitle(context),
            );
          },
        ) 
      ),
    );
  }
}