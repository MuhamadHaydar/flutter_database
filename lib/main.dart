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
          onPressed: (){
            _update();
          },
        ),FlatButton(
          child: Text('Delete'),
          onPressed: (){
            _delete();
          },
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

  void _update()async{
    Map<String,dynamic> row = {
      DatabaseHelper.columnName: 'Keval',
      DatabaseHelper.columnAge: 31
    };

    final updatedRow = await databaseHelper.update(row);

    print('Number of updated Row is $updatedRow');
  }

  void _delete()async{
    // we get back the id of the last row by counting it.
    final id = await databaseHelper.queryRowCount();
    final deletedRow = await databaseHelper.delete(id);
    print('This is deleted row $deletedRow: row id: $id');
  }
}






