import 'package:flutter/material.dart';

class StackDemo extends StatefulWidget {
  @override
  _StackDemo createState() => _StackDemo();
}

class _StackDemo extends State<StackDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('StackDemo'),
      ),
      body: new Column(children: <Widget>[
            new SizedBox(height: 20.0),
            new Stack(
              alignment: const FractionalOffset(0.9, 0.1),//方法一
              children: <Widget>[
                new Image(
                  image: new AssetImage('images/logo.png'),
                  width: 300.0,
                  height: 200.0,
                  fit: BoxFit.cover,
                ),
                new Opacity(
                  opacity: 0.8,
                  child: new Image(
                    image: new AssetImage('images/logo.png'),
                    width: 200.0,
                    height: 150.0,
                    fit: BoxFit.cover,
                  ),
                ),
                new GestureDetector(
                  onTap: () {
                    
                  },
                  child: new Icon(Icons.share, color: Colors.white),
                ),
              ],
            ),
            new SizedBox(height: 20.0),
            new Stack(
              children: <Widget>[
                new Image(
                  image: new AssetImage('images/logo.png'),
                  width: 300.0,
                  height: 200.0,
                  fit: BoxFit.cover,
                ),
                new Positioned(//方法二
                  right: 15.0,
                  top: 15.0,
                  child: new Icon(
                    Icons.share,
                    color: Colors.white,
                  ),
                ),
              ],
            )
          
      ],)
        );
      }
}



        