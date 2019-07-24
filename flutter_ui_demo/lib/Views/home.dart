import 'package:flutter/material.dart';
import 'package:flutter_ui_demo/Views/ListDemo.dart';
import 'package:flutter_ui_demo/Views/Stack.dart' as prefix0;
import './TextDemo.dart';
import './ButtonDemo.dart';
import './FlutterGrammar.dart';
import './TextFieldDemo.dart';
import './ImageDemo.dart';
import './Container.dart';
import './Padding.dart';
import './Center.dart';
import './Stack.dart';
import './ListDemo.dart';
import 'Column.dart';
import 'Row.dart';
import './GridViewDemo.dart';
import './ListViewDemo.dart';
import './StackViewDemo.dart';
import './Card.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final viewList = ['FlutterGrammar','text', 'button', 'TextField', 'image', 'Container', 
  'Padding', 'Center', 'Stack', 'List', 'Column', 'Row', 'GridViewDemo', 'ListViewDemo', 'StackViewDemo', 'Card'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('首页'),
      ),
      body: _buildList(),
    );
  }
  
  Widget _buildList() {
    return new ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: viewList.length,
      itemBuilder: (content, i) {
        return _buildRow(viewList[i]);
      }
    );
  }

  Widget _buildRow(String txt) {
    return ListTile(
      title: new Text(txt),
      onTap: (){
        _pushSaved(txt);
      },
    );
  }

  void _pushSaved(String txt) {
    if (txt == "FlutterGrammar") {
          Navigator.push(context,
          MaterialPageRoute(builder: (context) => FlutterGarmmar()));
    } else if (txt == "text") {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => TextDemo()));
    } else if (txt == "button") {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => ButtonDemo()));
    } else if (txt == "TextField") {
          Navigator.push(context,
          MaterialPageRoute(builder: (context) => TextFieldPage()));
    } else if (txt == "image") {
          Navigator.push(context,
          MaterialPageRoute(builder: (context) => ImageViewWidget()));
    } else if (txt == "Container") {
          Navigator.push(context,
          MaterialPageRoute(builder: (context) => ContainerDemo()));
    } else if (txt == "Center") {
          Navigator.push(context,
          MaterialPageRoute(builder: (context) => CenterDemo()));
    } else if (txt == "Stack") {
          Navigator.push(context,
          MaterialPageRoute(builder: (context) => StackDemo()));
    } else if (txt == "List") {
          Navigator.push(context,
          MaterialPageRoute(builder: (context) => ListDemo()));
    } else if (txt == "Column") {
          Navigator.push(context,
          MaterialPageRoute(builder: (context) => ColumnDemo()));
    } else if (txt == "Row") {
          Navigator.push(context,
          MaterialPageRoute(builder: (context) => RowDemo()));
    } else if (txt == "GridViewDemo") {
          Navigator.push(context,
          MaterialPageRoute(builder: (context) => GridViewDemo()));
    } else if (txt == "ListViewDemo") {
          Navigator.push(context,
          MaterialPageRoute(builder: (context) => ListViewDemo()));
    } else if (txt == "StackViewDemo") {
          Navigator.push(context,
          MaterialPageRoute(builder: (context) => StackViewDemo()));
    } else if (txt == "Card") {
          Navigator.push(context,
          MaterialPageRoute(builder: (context) => CardDemo()));
    } else {
      print(txt); 
    }
  }
     
  
}