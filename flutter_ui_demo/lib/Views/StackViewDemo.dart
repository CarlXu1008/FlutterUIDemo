
import 'package:flutter/material.dart';

class StackViewDemo extends StatefulWidget {
  @override
  _StackViewDemo createState() => _StackViewDemo();
}

class _StackViewDemo extends State<StackViewDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('StackViewDemo'),
      ),
     body: new Center(child: new Stack(
       alignment: const Alignment(0, 0.5),
       children: <Widget>[
         stack,
          new Container(
            padding: EdgeInsets.all(10.0),
            child: Text(
               "Carl", 
               style: TextStyle(backgroundColor: Colors.blue)
              ),
          )
       ],
     ),
     heightFactor: 100,)
    );
  }

  // 只能2把后面的堆叠在前员工视图上
  var stack = new Stack(
      alignment: const Alignment(0, 0),
      children: [
        new CircleAvatar(
          backgroundImage: new AssetImage('images/logo.png'),
          radius: 100.0,
        ),
        new Container(
          decoration: new BoxDecoration(
            color: Colors.black45,
          ),
          child: new Text(
            'Mia B',
            style: new TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        
      ],
    );
}