import 'dart:convert';
import 'dart:html';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class HttpClient {


   getRequest() async {
    Dio dio = new Dio();
    var response = await dio.get('https://flutter.dev', options: Options(headers: {"user-agent" : "Custom-UA"}));
    if (response.statusCode == HttpStatus.ok) {
      print(response.data.toString());
    } else {
      print("Error: ${response.statusCode}");
    }
  }

  updateFile() async {
    Dio dio = new Dio();
    FormData formData = FormData.from({ "file1": UploadFileInfo(File("./file1.txt"), "file1.txt"), 
    "file2": UploadFileInfo(File("./file2.txt"), "file1.txt"),});
    var response = await dio.post("https://xxx.com/upload", data: formData);
    print(response.toString());
  }

  downloadFile() async {
    Dio dio = new Dio();
    // dio.download("https://xxx.com/file1", "xx1.zip")
    dio.download("https://xxx.com/file1", "xx2.zip", onReceiveProgress: (count,total){

    });
  }

  groupRequest() async {
    Dio dio = new Dio();
    //同时发起两个并行请求
    List<Response> responseX = await Future.wait([dio.get('https://flutter.dev'), dio.get('https://flutter.dev')])
    //打印请求1响应结果
    print("Response1: ${responseX[0].toString()}");
    //打印请求2响应结果
    print("Response2: ${responseX[1].toString()}");
  }

}

class Student {
  // 属性
  String id;
  String name;
  int score;
  List<Teacher> teachers;

  //构造方法
  Student({
    this.id,
    this.name,
    this.score,
    this.teachers
  });

  // JSON解析工厂类
  factory Student.fromJson(Map<String, dynamic> parsedJson) {
    return Student(
      id: parsedJson['id'],
      name: parsedJson['name'],
      score: parsedJson['score'],
      teachers: Teacher.getTeacher(parsedJson['teachers'])
    );
  }

  


loadStudent() {
  
String jsonString = '''
  {
    "id":"123",
    "name":"张三",
    "score" : 95,
    "teachers": [
       {
         "name": "李四",
         "age" : 40
       },
       {
         "name": "王五",
         "age" : 45
       }
    ]
  }
  ''';
  final jsonResponse = json.decode(jsonString);
  Student student = Student.fromJson(jsonResponse);
  print(student.name);
}

}

class Teacher {
  String name;
  int age;

  Teacher({
    this.name,
    this.age
  });

  factory Teacher.fromJson(Map<String, dynamic>parsedJson) {
    return Teacher(
      name: parsedJson['name'],
      age: parsedJson['age']
    );
  }

  static List<Teacher>getTeacher(dynamic list) {
    List<Teacher> teachers = new List();
    for (var item in list) {
      teachers.add(Teacher.fromJson(item));
    }
    return teachers;
  }

}