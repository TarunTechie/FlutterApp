
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

//
class appmainstate extends StatefulWidget
{
  State<appmainstate> createState()=> appMain();
}
class appMain extends State<appmainstate>
{
  final randompair=<WordPair>[]; 
  final savedpairs=Set<WordPair>();
  Widget buildList()
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
    final alreadysaved=savedpairs.contains(pair);
    return ListTile(title:Text(pair.asPascalCase,style: TextStyle(fontSize: 20)),
    trailing: Icon(alreadysaved?Icons.favorite:Icons.favorite_outline,color: alreadysaved?Colors.red:null),
    onTap:()
    {
      setState(() {
        if(alreadysaved)
        {
          savedpairs.remove(pair);
        }
        else
        {
          savedpairs.add(pair);
        }
      });
    }
    );
  }
  void pushsaved()
  {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (BuildContext context)
      {
        final Iterable<ListTile>tiles=savedpairs.map((WordPair pair){
          return ListTile(title: Text(pair.asPascalCase,style: TextStyle(fontSize: 15),),);
        }); 
        final List<Widget>divided=ListTile.divideTiles(context:context,tiles:tiles).toList();
        return Scaffold(
          appBar: AppBar(title: Text("SAVED PAIRS")),
          body: ListView(children:divided),
        );
      }
      )
    );
  }
  Widget build(BuildContext context)
  {
    return
    Scaffold(
      appBar:AppBar(title: Text("RANDOM WORD PAIRS"),
      actions: [IconButton(onPressed: pushsaved, icon:Icon(Icons.list))],),
      body:buildList(),
    );
  }
  }
