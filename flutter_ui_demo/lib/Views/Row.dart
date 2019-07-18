import 'package:flutter/material.dart';

class RowDemo extends StatefulWidget {
  @override
  _RowDemo createState() => _RowDemo();
}

class _RowDemo extends State<RowDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ColumnDemo'),
      ),
      body: new ListView(
        children: <Widget>[
          buildImageView(),
          getTitleRow(),
          getButtonRow(),
          buildText()
        ],
      )
    );
  }

  Widget getTitleRow() {
    return new Container(
      padding: const EdgeInsets.all(32.0),
      child: new Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          new Expanded(
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Container(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: new Text(
                    'Carl Xu',
                    style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                ),
                new Text(
                  'iOS Developer',
                  style: TextStyle(color: Colors.grey[500])
                ),
              ],
            ),
          ),
          new Icon(
            Icons.star,
            color: Colors.red[500],
          ),
          new Text(
            '42'
          )
        ],
      ),
    );
  }

  Widget getButtonRow() {
    return new Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        buildButtonColum(Icons.call, 'call'),
        buildButtonColum(Icons.near_me, 'route'),
        buildButtonColum(Icons.share, 'share')
      ],
    );
  }

  Widget buildButtonColum(IconData icon, String label) {
    Color color = Colors.blue;
    return new Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        new Icon(
          icon, color: color,
        ),
        new Container(
          margin: const EdgeInsets.only(top: 8.0),
          child: new Text(
             label,
              style: TextStyle(
                fontSize: 12.0,
                fontWeight: FontWeight.w400,
                color: color
              ),
          ),
        ),
      ],
    );
    
  }

  Widget buildText() {
    return new Container(
      padding: const EdgeInsets.all(32.0),
      child: new Text(
        '''
        Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese Alps. Situated 1,578 meters above sea level, it is one of the larger Alpine Lakes. A gondola ride from Kandersteg, followed by a half-hour walk through pastures and pine forest, leads you to the lake, which warms to 20 degrees Celsius in the summer. Activities enjoyed here include rowing, and riding the summer toboggan run.
        '''
      ),
    );
  }

  Widget buildImageView() {
    return new Image.asset(
      'images/logo.png',
      height: 240,
      fit: BoxFit.cover,
    );
  }



}

