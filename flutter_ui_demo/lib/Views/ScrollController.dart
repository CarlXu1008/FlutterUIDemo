import 'package:flutter/material.dart';

class ScrollControllerDemo extends StatefulWidget {

  @override
  _ScrollControllerDemoState createState() => _ScrollControllerDemoState();
}

class _ScrollControllerDemoState extends State<ScrollControllerDemo> {
  ScrollController _controller;
  bool isTop = false;

  @override
  void initState() {
    _controller = ScrollController();
    _controller.addListener( () {
      if (_controller.offset > 1000) {
        isTop = true;
      } else if (_controller.offset < 300) {
        isTop = false;
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(title: Text('ScrollControllerDemo'),actions: <Widget>[
        RaisedButton(onPressed: isTop ? (){
          if (isTop) {
            _controller.animateTo(.0,
            duration: Duration(milliseconds: 200),
            curve: Curves.ease);
          }
        }:null,child: Text("Top"),)
      ],),
      body: NotificationListener<ScrollNotification>(
        onNotification: (scrollNotification){
          if (scrollNotification is ScrollStartNotification) {
            print('Scroll Start');
          } else if (scrollNotification is ScrollUpdateNotification) {
            print('Scroll  update');
          } else if (scrollNotification is ScrollEndNotification) {
            print('Scroll end');
          }
        },child: ListView.separated(
          controller: _controller,
          itemCount: 1000,
          separatorBuilder: (BuildContext content, int index) => Divider(color: Colors.grey),
          itemBuilder: (context, index) => ListTile(title: Text('Index : $index'),)
        ),
      )
    );
  }
}