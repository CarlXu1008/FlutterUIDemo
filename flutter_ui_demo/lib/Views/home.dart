import 'package:flutter/material.dart';
import './TextDemo.dart';
import './ButtonDemo.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final viewList = ['text', 'button', 'List', 'grid'];
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
    if (txt == "text") {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => TextDemo()));
    } else if (txt == "button") {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => ButtonDemo()));
    } else {
      print(txt);
    }
  }
     
  
}