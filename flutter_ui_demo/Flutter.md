
Flutter 中 setState  很有 React Native 的既视感，Flutter 中也是通过 state 跨帧实现管理数据状态的，这个后面会详细讲到。
 Flutter 中一切皆 Widget 呈现，通过 build方法返回 Widget，这也是和 React Native 中，通过 render 函数返回需要渲染的 component 一样的模式。

### Flutter Widget

>  在 Flutter 中，一切的显示都是 Widget 。Widget 是一切的基础，作为响应式的渲染，属于 MVVM 的实现机制。我们可以通过修改数据，再用setState 设置数据，Flutter 会自动通过绑定的数据更新 Widget 。 所以你需要做的就是实现 Widget 界面，并且和数据绑定起来。

 Widget 分为 有状态 和 无状态 两种，在 Flutter 中每个页面都是一帧。无状态就是保持在那一帧。而有状态的 Widget 当数据更新时，其实是绘制了新的 Widget，只是 State 实现了跨帧的数据同步保存。

### 无状态StatelessWidget

> 继承 StatelessWidget，通过 build 方法返回一个布局好的控件。

Widget 和 Widget 之间通过 child: 进行嵌套。其中有的 Widget 只能有一个 child，比如下方的 Container ；有的 Widget 可以多个 child ，也就是children:，比如` Column 布局。下方代码便是 Container Widget 嵌套了 Text Widget。

```
import 'package:flutter/material.dart';

class DEMOWidget extends StatelessWidget {
  final String text;

  //数据可以通过构造方法传递进来
  DEMOWidget(this.text);

  @override
  Widget build(BuildContext context) {
    //这里返回你需要的控件
    //这里末尾有没有的逗号，对于格式化代码而已是不一样的。
    return Container(
      //白色背景
      color: Colors.white,
      //Dart语法中，?? 表示如果text为空，就返回尾号后的内容。
      child: Text(text ?? "这就是无状态DMEO"),
    );
  }
}
```

### 有状态StatefulWidget

> 你需要创建管理的是主要是 State ， 通过 State 的 build 方法去构建控件。在 State 中，你可以动态改变数据，这类似 MVVM 实现，在 setState 之后，改变的数据会触发 Widget 重新构建刷新。

而下方代码中，是通过延两秒之后，让文本显示为 "这就变了数值"。
- initState ：初始化，理论上只有初始化一次，第二篇中会说特殊情况下。
- didChangeDependencies：在 initState 之后调用，此时可以获取其他 State 。
- dispose ：销毁，只会调用一次。

> 你的关注点只要在：创建你的 StatelessWidget 或者 StatefulWidget 而已。你需要的就是在 build 中堆积你的布局，然后把数据添加到 Widget 中，最后通过 setState 改变数据，从而实现画面变化。

```
import 'dart:async';
import 'package:flutter/material.dart';

class DemoStateWidget extends StatefulWidget {

  final String text;

  ////通过构造方法传值
  DemoStateWidget(this.text);

  ///主要是负责创建state
  @override
  _DemoStateWidgetState createState() => _DemoStateWidgetState(text);
}

class _DemoStateWidgetState extends State<DemoStateWidget> {

  String text;

  _DemoStateWidgetState(this.text);
  
  @override
  void initState() {
    ///初始化，这个函数在生命周期中只调用一次
    super.initState();
    ///定时2秒
    new Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        text = "这就变了数值";
      });
    });
  }

  @override
  void dispose() {
    ///销毁
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    ///在initState之后调 Called when a dependency of this [State] object changes.
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(text ?? "这就是有状态DMEO"),
    );
  }
}

```

### Flutter UI控件


类型 | 作用特点
---|---
MaterialApp | 一般作为APP顶层的主页入口，可配置主题，多语言，路由等
Scaffold | 一般用户页面的承载Widget，包含appbar、snackbar、drawer等material design的设定。
Appbar | 一般用于Scaffold的appbar，内有标题，二级页面返回按键等，当然不止这些，tabbar等也会需要它 
Text | 显示文本，几乎都会用到，主要是通过style设置TextStyle来设置字体样式等。
RichText | 富文本，通过设置TextSpan，可以拼接出富文本场景。
TextField | 文本输入框 ：new TextField(controller: //文本控制器, obscureText: "hint文本");
Image | 图片加载: new FadeInImage.assetNetwork( placeholder: "预览图", fit: BoxFit.fitWidth, image: "url")
FlatButton | 按键点击: new FlatButton(onPressed: () {},child: new Container());
Container | 只有一个子 Widget。默认充满，包含了padding、margin、color、宽高、decoration 等配置。
Padding | 只有一个子 Widget。只用于设置Padding，常用于嵌套child，给child设置padding。
Center | 只有一个子 Widget。只用于居中显示，常用于嵌套child，给child设置居中。
Stack | 可以有多个子 Widget。 子Widget堆叠在一起。
Column | 可以有多个子 Widget。垂直布局。
Row | 可以有多个子 Widget。水平布局。
Expanded | 只有一个子 Widget。在 Column 和 Row 中充满。
ListView | 可以有多个子 Widget。


- Container ：最常用的默认布局！只能包含一个child:，支持配置 padding,margin,color,宽高,decoration（一般配置边框和阴影）等配置，在 Flutter 中，不是所有的控件都有 宽高、padding、margin、color 等属性，所以才会有 Padding、Center 等 Widget 的存在。

```
    new Container(
        ///四周10大小的maring
        margin: EdgeInsets.all(10.0),
        height: 120.0,
        width: 500.0,
        ///透明黑色遮罩
        decoration: new BoxDecoration(
            ///弧度为4.0
            borderRadius: BorderRadius.all(Radius.circular(4.0)),
            ///设置了decoration的color，就不能设置Container的color。
            color: Colors.black,
            ///边框
            border: new Border.all(color: Color(GSYColors.subTextColor), width: 0.3)),
        child:new Text("666666"));

```

- Column、Row 绝对是必备布局， 横竖布局也是日常中最常见的场景。如下方所示，它们常用的有这些属性配置：主轴方向是 start 或 center 等；副轴方向方向是 start 或 center 等；mainAxisSize 是充满最大尺寸，或者只根据子 Widget 显示最小尺寸。

```
//主轴方向，Column的竖向、Row我的横向
mainAxisAlignment: MainAxisAlignment.start, 
//默认是最大充满、还是根据child显示最小大小
mainAxisSize: MainAxisSize.max,
//副轴方向，Column的横向、Row我的竖向
crossAxisAlignment :CrossAxisAlignment.center
```


- 创建一个私有方法_getBottomItem，返回一个 Expanded Widget，因为后面我们需要将这个方法返回的 Widget 在 Row 下平均充满。

```
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

```


### Flutter 布局
> Flex 布局语法教程： https://www.runoob.com/w3cnote/flex-grammar.html

