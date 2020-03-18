import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',

      home:Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          elevation: 5.0,
          title: Text('Database'),
        ),
        body: Home(),
      )
    );
  }
}


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        FlatButton(
          child: Text('Insert'),
          onPressed: (){},
        ),FlatButton(
          child: Text('Query'),
          onPressed: (){},
        ),FlatButton(
          child: Text('Update'),
          onPressed: (){},
        ),FlatButton(
          child: Text('Delete'),
          onPressed: (){},
        )
      ],
    );
  }
}




