import 'package:flutter/material.dart';
void main()=>runApp(firstApp());
class firstApp extends StatelessWidget
{
  @override
  Widget build(BuildContext context) 
  {
    return MaterialApp(home:appMain());
  }
}
class appMain extends StatelessWidget
{
  Widget buildlist()
  {
    return
    ListView(
  padding: const EdgeInsets.all(8),
  children: <Widget>[
    Container(
      height: 50,
      color: Colors.amber[600],
      child: const Center(child: Text('ITEM ONE')),
    ),
    Container(
      height: 50,
      color: Colors.amber[500],
      child: const Center(child: Text('ITEM TWO')),
    ),
    Container(
      height: 50,
      color: Colors.amber[100],
      child: const Center(child: Text('ITEM THREE')),
    ),
  ],
);
  }
  Widget build(BuildContext)
  {
    return
    Scaffold(
      appBar:AppBar(title: Text("APP TITLE"),),
      body:buildlist()
    );
  }
}