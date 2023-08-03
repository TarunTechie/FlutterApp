import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
void main()=>runApp(firstApp());
class firstApp extends StatelessWidget
{
  @override
  Widget build(BuildContext context) 
  {
    return MaterialApp(home:appmainstate());
  }
}
class appmainstate extends StatefulWidget
{
  State<appmainstate> createState()=> appMain();
}
class appMain extends State<appmainstate>
{
  final randompair=<WordPair>[]; 
  Widget buildlist()
  {
    return
    ListView.builder(
  padding: const EdgeInsets.all(8),
  itemBuilder:(context,item)
  {
    if(item.isOdd)return Divider();
    final index=item~/2;
    if(index>=randompair.length)
    {
      randompair.addAll(generateWordPairs().take(10));
    }
    return buildrow(randompair[index]);
  }
);
  }
  Widget buildrow(WordPair pair)
  {
    return ListTile(title:Text(pair.asPascalCase,style: TextStyle(fontSize: 20)));
  }
  Widget build(BuildContext context)
  {
    return
    Scaffold(
      appBar:AppBar(title: Text("APP TITLE"),),
      body:buildlist()
    );
  }
}