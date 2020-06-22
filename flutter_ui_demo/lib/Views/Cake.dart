import 'package:flutter/material.dart';
import './WheelPainter.dart';
import 'package:date_format/date_format.dart';

class Cake extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Cake'),),
      body: CustomPaint(
        size: Size(200, 200),
        painter: WheelPainter(),
      ),
    );
  }

   getCard() {
     print(formatDate(DateTime.now(), [mm, '月', dd, '日', hh, ':', n]));
  }

}