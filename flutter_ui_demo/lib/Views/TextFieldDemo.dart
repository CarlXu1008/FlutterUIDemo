import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class TextFieldPage extends StatefulWidget {
  @override
  _TextFieldPage createState() => _TextFieldPage();
}

class _TextFieldPage extends State<TextFieldPage> {
 @override
  Widget build(BuildContext context) {
    final controller = TextEditingController();
    controller.addListener(() {
      print('input ${controller.text}');
    });
    return Scaffold(
      appBar: AppBar(
        title: Text('TextField'),
      ),
      body: Column(children: <Widget>[
        Padding(
        padding: const EdgeInsets.all(20.0),
        child: buildTextField(controller),
      ),
      TextField(
        decoration:
            InputDecoration(fillColor: Colors.blue.shade100, filled: true, labelText: 'Hello'),
      ),
      Padding(
        padding: const EdgeInsets.all(20.0),
        child: buildSecondTextField(),
      ),
      Padding(
        padding: const EdgeInsets.all(20.0),
        child: buildCornerRadioTextField(),
      ),
      
      ],)
    );
  }
  
  Widget buildTextField(TextEditingController controller) {
    return TextField(
      controller: controller,
      maxLength: 30,//最大长度，设置此项会让TextField右下角有一个输入数量的统计字符串
      maxLines: 1,//最大行数
      autocorrect: true,//是否自动更正
      autofocus: true,//是否自动对焦
      obscureText: true,//是否是密码
      textAlign: TextAlign.center,//文本对齐方式
      style: TextStyle(fontSize: 30.0, color: Colors.blue),//输入文本的样式
      inputFormatters: [WhitelistingTextInputFormatter.digitsOnly],//允许的输入格式
      onChanged: (text) {//内容改变的回调
        print('change $text');
      },
      onSubmitted: (text) {//内容提交(按回车)的回调
        print('submit $text');
      },
      enabled: true,//是否禁用
    );
  }

  Widget buildSecondTextField() {
      return TextField(
        decoration: InputDecoration(
            fillColor: Colors.blue.shade100,
            filled: true,
            helperText: 'help',
            prefixIcon: Icon(Icons.local_airport),
            suffixText: 'airport'),
      );
    }

 Widget buildCornerRadioTextField() {
    return TextField(
      decoration: InputDecoration(
          contentPadding: EdgeInsets.all(10.0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0),
//            borderSide: BorderSide(color: Colors.red, width: 3.0, style: BorderStyle.solid)//没什么卵效果
          )),
    );
  }

}
