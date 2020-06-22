
import 'package:flutter/material.dart';

class CustomScrollViewDemo extends StatefulWidget {
  @override
  _CustomScrollViewState createState() => _CustomScrollViewState();
}

class _CustomScrollViewState extends State<CustomScrollViewDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('CustomScrollView'),
        ),
        body: getScrollView(),
    );
  }

  Widget getScrollView() {
    return CustomScrollView(slivers: <Widget>[
      SliverAppBar(
        title: Text('CustomScrollView Demo'),
        floating: true,
        expandedHeight: 300,
        flexibleSpace: Image.network('http://n.sinaimg.cn/sports/2_img/upload/cf0d0fdd/107/w1024h683/20181128/pKtl-hphsupx4744393.jpg', fit: BoxFit.cover),
      ),
      SliverList(
        delegate: SliverChildBuilderDelegate(
          (context, index) => ListTile(title: Text('Item #$index')),
          childCount: 100,
        ),
      )
    ],);
  }

}



