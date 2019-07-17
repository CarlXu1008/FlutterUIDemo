import 'package:flutter/material.dart';

class ButtonDemo extends StatefulWidget {
  @override
  _ButtonDemo createState() => _ButtonDemo();
}

class _ButtonDemo extends State<ButtonDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Button'),
      ),body: Center(child: Column(children: <Widget>[
        new Text("MaterialButton/IconButton/FloatingActionButton"),
        new MaterialButton(
          color: Colors.blue,
          textColor: Colors.white,
          child: new Text('MaterialButton'),
          onPressed: () {
              // ...
        },
      ),
      new RaisedButton(
          child: new Text('RaisedButton'),
          onPressed: () {},
      ),
      new FlatButton(
          child: new Text('FlatButton'),
          onPressed: () {},
      ),
      new IconButton(
          icon: new Icon(Icons.volume_up),
          tooltip: 'Increase volume by 10%',
          onPressed: () {
              // ...
          },
      ),
     new FloatingActionButton(
          onPressed: () {},
          child: new Icon(Icons.add_a_photo),
          elevation: 3.0,
          highlightElevation: 2.0,
          backgroundColor: Colors.red,        // 红色
      ),
      new ButtonBar(
          children: <Widget>[
              new CloseButton(),
              new BackButton(),
          ],
      )
      ],),),
    );
  }
}

