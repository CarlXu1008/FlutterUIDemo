import 'package:flutter/material.dart';

class TouchEventDemo extends StatefulWidget {

 @override
  _TouchEventDemoState createState() => _TouchEventDemoState();
}

class _TouchEventDemoState extends State<TouchEventDemo> {
   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Touch event'),),
      body: gestureInner(),
    );
  }

  Widget getListerView() {
    return Listener(
        child: Container(
          color: Colors.red,
          width: 200,
          height: 200,
        ),
        onPointerDown: (event) => print('onPointerDown- '),
        onPointerMove: (e) => print('onPointerMove- '),
        onPointerUp: (e) => print('onPointerUp- '),
      );
  }

double _top = 0.0;
double _left = 0.0;

  Widget getGestureView() {
    return Stack(
      children: <Widget>[
        Positioned(
          top: _top,
          left: _left,
          child: GestureDetector(
            child: Container(color: Colors.red, width: 50,height: 50,),
            onTap: () => print('tap'),
            onDoubleTap: () => print('Double tap'),
            onLongPress: () => print('long press'),
            onPanUpdate: (e) {
              print('onPanUpdate ${e.delta.dx}');
              setState(() {
                //更新位置 
                _left += e.delta.dx; 
                _top += e.delta.dy;
              });
            },
          ),
        )
      ],
    );
  }

  Widget gestureInner() {
    return 
GestureDetector(
  onTap: () => print('Parent tapped'),//父视图的点击回调
  child: Container(
    color: Colors.pinkAccent,
    child: Center(
      child: GestureDetector(
        onTap: () => print('Child tapped'),//子视图的点击回调
        child: Container(
          color: Colors.blueAccent,
          width: 200.0,
          height: 200.0,
        ),
      ),
    ),
  ),
);
  }

}