
import 'package:flutter/material.dart';

class GridViewDemo extends StatefulWidget {
  @override
  _GridViewDemo createState() => _GridViewDemo();
}

class _GridViewDemo extends State<GridViewDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GridViewDemo'),
      ),
      body: new Center(
        heightFactor: 300,
        child: new GridView.extent(
        maxCrossAxisExtent: 150,
        padding: const EdgeInsets.all(4.0),
        mainAxisSpacing: 4.0,
        crossAxisSpacing: 4.0,
        children: <Widget>[
          Image.asset('images/logo.png'),
          Image.asset('images/logo.png'),
          Image.asset('images/logo.png'),
          Image.asset('images/logo.png'),
          Image.asset('images/logo.png'),
          Image.asset('images/logo.png'),
          Image.asset('images/logo.png'),
        ],
      ),
      )
    );
  }

  


}