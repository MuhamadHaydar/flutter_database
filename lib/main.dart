import 'package:flutter/material.dart';
import 'package:flutterdatabase/databasehelper.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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

  DatabaseHelper databaseHelper = DatabaseHelper.instance;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        FlatButton(
          child: Text('Insert'),
          onPressed: (){
            _insert();
          },
        ),FlatButton(
          child: Text('Query'),
          onPressed: (){
            _query();
          },
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

  void _insert()async{
    Map<String,dynamic> row = {
     DatabaseHelper.columnName: 'Bob',
      DatabaseHelper.columnAge: 11
    };

    final id = await databaseHelper.insert(row);

    print('insert row id: $id');
  }

  void _query() async{
    final allRows = await databaseHelper.queryAllRows();
    print('query all rows:');
    allRows.forEach((row){print(row);});
  }
}






