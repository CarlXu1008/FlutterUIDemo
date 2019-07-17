import 'package:flutter/material.dart';

class TextDemo extends StatefulWidget {
  @override
  _TextDemo createState() => _TextDemo();
}

class _TextDemo extends State<TextDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TextDemo'),
      ),body: Column(children: <Widget>[
        _myTextView(),
        new Text("参考链接： https://blog.csdn.net/yuzhiqiang_1993/article/details/84967388"),
        _getMyRichTextView()
      ],),
    );
  }
  
  _myTextView() {
    return Text(
      "Flutter is Google’s mobile UI framework for crafting high-quality native interfaces on iOS and Android in record time. Flutter works with existing code, is used by developers and organizations around the world, and is free and open source.",
      style: TextStyle(
        color: Colors.red,
        fontSize: 18,
        letterSpacing: 1,
        wordSpacing: 2,
        height: 1.2,
        fontWeight: FontWeight.w600,
      ),
      textAlign: TextAlign.center,
    );
  }

  _getMyRichTextView() {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
              text: "网址:",
              style: TextStyle(
                color: Colors.black,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              )),
          TextSpan(
            text: "http//:baidu.com/",
            style: TextStyle(
              color: Colors.blue,
              fontSize: 24,
              fontStyle: FontStyle.italic,
            ),
          ),
        ],
      ),
    );
  }
}