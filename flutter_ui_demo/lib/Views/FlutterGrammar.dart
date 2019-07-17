import 'package:flutter/material.dart';
import './../Model/UserInfo.dart';

class FlutterGarmmar extends StatefulWidget {
  @override
  _FlutterGarmmar createState() => _FlutterGarmmar();
}

class _FlutterGarmmar extends State<FlutterGarmmar> {
  final user = User.empty();
  final user1 = User.withName("Carl");
  final user2 = User("carl", 23, "iOS");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FlutterGarmmar'),
      ),
      body: new Center(child: 
        new Container(
          height: 600,
          child: ListView.builder(itemBuilder: (context, index){
            if (index == 0) {
              return new Text(user2.name);
            } else if (index == 1){
              return new Text(user2.age.toString());
            } else if (index == 2) {
              return new Text(user2.job);
            } else if (index == 3) {
              return  _buildContainerView();
            } else if (index == 4) {
              return _buildColumnView();
            } else if (index == 5) {
              return _getRowView();
            }
          },
          shrinkWrap: true,//使用子控件的总长度来设置ListView的长度（这里的长度为高度）
          itemCount: 10,
          padding: EdgeInsets.all(16)),
        )

      ),
    );
  }

  // Container 
  _buildContainerView() {
    return new Container(
              ///四周10大小的maring
              margin: EdgeInsets.all(10.0),
              height: 120.0,
              width: 500.0,
              ///透明黑色遮罩
              decoration: new BoxDecoration(
                  ///弧度为4.0
                  borderRadius: BorderRadius.all(Radius.circular(4.0)),
                  ///设置了decoration的color，就不能设置Container的color。
                  color: Colors.greenAccent,
                  ///边框
                  border: new Border.all(color: Colors.cyan, width: 0.3)),
                  // Center 控件包一层让子控件居中显示
              child: new Center(child: new Text("我是Container视图控件")),);
  }

  _buildColumnView() {
    return new Container(
      height: 100,
      child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      ///大小按照最小显示
      mainAxisSize : MainAxisSize.min,
      ///横向也居中
      crossAxisAlignment : CrossAxisAlignment.center,
      children: <Widget>[
        new Text('第一行',
        style: TextStyle(color: Colors.red, backgroundColor: Colors.cyan, fontSize: 18, fontWeight: FontWeight.w800),
        textAlign: TextAlign.end,
        textDirection: TextDirection.ltr),
        // 使用 Expanded 控件需要给其父控件明确的高度， 不然会报错。
        new Expanded(child: new Text("第二行"), flex: 1),
        new Expanded(child: new Text("第三行"), flex: 1),
        new Expanded(child: new Text("ssss"),)
      ],
    ),
    );
  }


    ///返回一个居中带图标和文本的Item
  _getBottomItem(IconData icon, String text) {
    ///充满 Row 横向的布局
    return new Expanded(
      flex: 1,
      ///居中显示
      child: new Center(
        ///横向布局
        child: new Row(
          ///主轴居中,即是横向居中
          mainAxisAlignment: MainAxisAlignment.center,
          ///大小按照最大充满
          mainAxisSize : MainAxisSize.max,
          ///竖向也居中
          crossAxisAlignment : CrossAxisAlignment.center,
          children: <Widget>[
            ///一个图标，大小16.0，灰色
            new Icon(
              icon,
              size: 16.0,
              color: Colors.grey,
            ),
            ///间隔
            new Padding(padding: new EdgeInsets.only(left:5.0)),
            ///显示文本
            new Text(
              text,
              //设置字体样式：颜色灰色，字体大小14.0
              style: new TextStyle(color: Colors.grey, fontSize: 14.0),
              //超过的省略为...显示
              overflow: TextOverflow.ellipsis,
              //最长一行
              maxLines: 1,
            ),
          ],
        ),
      ),
    );
  }

  _getRowView() {
    return new Container(
      ///卡片包装
      child: new Card(
           ///增加点击效果
          child: new FlatButton(
              onPressed: (){print("点击了哦");},
              child: new Padding(
                padding: new EdgeInsets.only(left: 0.0, top: 10.0, right: 10.0, bottom: 10.0),
                child: new Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    ///文本描述
                    new Container(
                        child: new Text(
                          "这是一点描述这是一点描述这是一点描述这是一点描述这是一点描述这是一点描述这是一点描述这是一点描述这是一点描述这是一点描述这是一点描述这是一点描述这是一点描述这是一点描述这是一点描述这是一点描述",
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 14.0,
                          ),
                          ///最长三行，超过 ... 显示
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                        margin: new EdgeInsets.only(top: 6.0, bottom: 2.0),
                        alignment: Alignment.topLeft),

                    new Padding(padding: EdgeInsets.all(10.0)),

                    ///三个平均分配的横向图标文字
                    new Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        _getBottomItem(Icons.star, "1000"),
                        _getBottomItem(Icons.link, "2000"),
                        _getBottomItem(Icons.subject, "3000"),
                      ],
                    ),
                  ],
                ),
              ))),
    );
  }

}



