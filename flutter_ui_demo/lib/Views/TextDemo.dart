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
      ),
    );
  }
}