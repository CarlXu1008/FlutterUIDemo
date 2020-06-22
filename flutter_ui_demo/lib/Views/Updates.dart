import 'package:flutter/material.dart';

class UpdateItemModel {
  String appIcon;//App图标
  String appName;//App名称
  String appSize;//App大小
  String appDate;//App更新日期
  String appDescription;//App更新文案
  String appVersion;//App版本
  //构造函数语法糖，为属性赋值
  UpdateItemModel({this.appIcon, this.appName, this.appSize, this.appDate, this.appDescription, this.appVersion});
}


class UpdatedItem extends StatelessWidget {
  final UpdateItemModel model;//数据模型
  //构造函数语法糖，用来给model赋值
  UpdatedItem({Key key,this.model, this.onPressed}) : super(key: key);
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Column(//用Column将上下两部分合体
        children: <Widget>[
          buildTopRow(context),//上半部分
          buildBottomRow(context)//下半部分
        ]);
  }
  

Widget buildTopRow(BuildContext context) {
  return Row(//Row控件，用来水平摆放子Widget
    children: <Widget>[
      Padding(//Paddng控件，用来设置Image控件边距
        padding: EdgeInsets.all(10),//上下左右边距均为10
        child: ClipRRect(//圆角矩形裁剪控件
          borderRadius: BorderRadius.circular(8.0),//圆角半径为8
          child: Image.asset(model.appIcon, width: 80,height:80)
        )
      ),
      Expanded(//Expanded控件，用来拉伸中间区域
        child: Column(//Column控件，用来垂直摆放子Widget
          mainAxisAlignment: MainAxisAlignment.center,//垂直方向居中对齐
          crossAxisAlignment: CrossAxisAlignment.start,//水平方向居左对齐
          children: <Widget>[
            Text(model.appName,maxLines: 1),//App名字
            Text(model.appDate,maxLines: 1),//App更新日期
          ],
        ),
      ),
      Padding(//Paddng控件，用来设置Widget间边距
        padding: EdgeInsets.fromLTRB(0,0,10,0),//右边距为10，其余均为0
        child: FlatButton(//按钮控件
          child: Text("OPEN"),
          onPressed: onPressed,//点击回调
        )
      )
  ]);
}


Widget buildBottomRow(BuildContext context) {
  return Padding(//Padding控件用来设置整体边距
    padding: EdgeInsets.fromLTRB(15,0,15,0),//左边距和右边距为15
    child: Column(//Column控件用来垂直摆放子Widget
      crossAxisAlignment: CrossAxisAlignment.start,//水平方向距左对齐
      children: <Widget>[
        Text(model.appDescription),//更新文案
        Padding(//Padding控件用来设置边距
          padding: EdgeInsets.fromLTRB(0,10,0,0),//上边距为10
          child: Text("${model.appVersion} • ${model.appSize} MB")
        )
      ]
  ));
}
  
}