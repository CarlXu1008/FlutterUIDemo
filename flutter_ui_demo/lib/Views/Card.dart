import 'package:flutter/material.dart';

class CardDemo extends StatefulWidget {
  @override
  _CardDemo createState() => _CardDemo();
}

class _CardDemo extends State<CardDemo> {
  @override
   Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('ListDemo'),
        ),
        body: new Container(
          height: 500,
          child: getCardView(),
        )
    );
  }

  Widget getCardView() {
    return new Card(
      child: Column(
        children: <Widget>[
          getHeadImageView(),
          new Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              new Padding(
                padding: const EdgeInsets.all(8),
                child: new Text("这是第1行标题", style: TextStyle(backgroundColor: Colors.red)),
              ),
              new Align(
                alignment: FractionalOffset.topLeft,
                child: new Text("这是第2行标题", style: TextStyle(backgroundColor: Colors.red)),
              ),
              new Align(
                alignment: FractionalOffset.center,
                child: new Text("这是第3行标题", style: TextStyle(backgroundColor: Colors.red)),
              ),
              new Align(
                alignment: FractionalOffset.topRight,
                child: new Text("这是第4行标题", style: TextStyle(backgroundColor: Colors.red)),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget getHeadImageView() {
    return new Stack(
      alignment: Alignment(-0.8, 0.8),
      children: <Widget>[
        new Image.asset("images/logo.png"),
        new Text(
          'Carl Xu',
          style: TextStyle(fontSize: 18, color: Colors.red),
        )
      ],
    );
  }

}