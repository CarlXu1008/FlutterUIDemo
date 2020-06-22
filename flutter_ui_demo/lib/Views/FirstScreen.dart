import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_ui_demo/Views/home.dart';

class FirstScreen extends StatefulWidget {
  
  @override
  State<StatefulWidget> createState() {
    return _FirstScreenState();
  }
}

class _FirstScreenState extends State<FirstScreen> {
  
  String _msg = 'hello';
  StreamSubscription subscription;

  @override
  void initState() {
    subscription = eventBus.on<CustomEvent>().listen( (event){
      setState(() {
        _msg += event.msg;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    subscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("firstPage"),),
      body: RaisedButton(
      child: Text(_msg),
      // onPressed: ()=> Navigator.pushNamed(context, "second_page",arguments: "Hey").then((msg)=>print(msg)),
      onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => SecondPage(), settings: RouteSettings(arguments: 'first page data'))).then((msg) => print(msg)),
      // onPressed: () => Navigator.pushNamed(context, "second_page", arguments: 'first page data').then((msg) => setState(_msg=msg))),
    ),
    );
  }
}



class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String data = ModalRoute.of(context).settings.arguments as String;
    return Scaffold(
      appBar: AppBar(title: Text('SecondPage'),),
      body: RaisedButton(
      child: Text('$data'),
      onPressed: () {
        Navigator.pop(context, 'second page data');
        eventBus.fire(CustomEvent('world'));
      }
    ),
    );
  }
}