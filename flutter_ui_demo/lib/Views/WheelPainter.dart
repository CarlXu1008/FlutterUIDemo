import 'dart:math';
import 'package:flutter/material.dart';

class WheelPainter extends CustomPainter {

  Paint getColoredPaint(Color color) {
    Paint paint = Paint();
    paint.color = color;
    return paint;
  }

  @override
  void paint(Canvas canvas, Size size) {
    double wheelSize = min(size.width, size.height)/2;
    double nbElem = 6;
    double radius = (2*pi) / nbElem;
    Rect boundingRect = Rect.fromCircle(center: Offset(wheelSize, wheelSize));
    canvas.drawArc(boundingRect, 0, radius, true, getColoredPaint(Colors.orange)); 
    canvas.drawArc(boundingRect, radius, radius, true, getColoredPaint(Colors.black38)); 
    canvas.drawArc(boundingRect, radius * 2, radius, true, getColoredPaint(Colors.green)); 
    canvas.drawArc(boundingRect, radius * 3, radius, true, getColoredPaint(Colors.red)); 
    canvas.drawArc(boundingRect, radius * 4, radius, true, getColoredPaint(Colors.blue)); 
    canvas.drawArc(boundingRect, radius * 5, radius, true, getColoredPaint(Colors.purple));
  }

  // 判断是否需要重绘，这里我们简单的做下比较即可
   @override
    bool shouldRepaint(CustomPainter oldDelegate) => oldDelegate != this;
}


