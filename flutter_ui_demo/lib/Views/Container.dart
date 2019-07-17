import 'package:flutter/material.dart';

class ContainerDemo extends StatefulWidget {
  @override
  _ContainerDemo createState() => _ContainerDemo();
}

class _ContainerDemo extends State<ContainerDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ListDemo'),
      ),
      body: new Container(
        alignment: Alignment.center,
        child: new Container(
          color: Colors.yellow,
          child: new Text("聆听璇律", style: new TextStyle(fontSize: 20.0)),
        ),
//        color: Colors.green,
        padding: const EdgeInsets.all(60.0),
        margin: const EdgeInsets.all(20.0),
        width: 180.0,
        height: 180.0,
        decoration: new BoxDecoration(
            gradient: const LinearGradient(
                colors: [Colors.lightBlue, Colors.greenAccent,Colors.purple])),
        foregroundDecoration: new BoxDecoration(
          border: new Border.all(
              color: Colors.redAccent, width: 10.0, style: BorderStyle.solid),
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}