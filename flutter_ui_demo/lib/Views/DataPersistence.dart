import 'dart:io';
import 'package:path_provider/path_provider.dart';

import 'package:shared_preferences/shared_preferences.dart';

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DataPersistence {


}


// 文件的读写: 文件比较适合大量的、有序的数据持久化
class LocalFileTool {

 // 创建文件目录函数
  Future<File> get _loalFile async {
    final directory = await getApplicationDocumentsDirectory();
    final path = directory.path;
    return File('$path/content.txt');
  }

// 写文件函数
  Future<File> writeContent(String content) async{
    final file = await _loalFile;
    return file.writeAsString(content);
  }

// 读文件函数
  Future<String> readContent() async {
    try {
      final file = await _loalFile;
      String contents = await file.readAsString();
      return contents;
    } catch (e) {
      print(e);
      return "";
    }
  }

}


class UserDefault {

  Future<int>_loadCounter() async {
    SharedPreferences perfse = await SharedPreferences.getInstance();
    int counter = perfse.getInt('counter') ?? 0;
    return counter;
  }

  Future<void> _incrementCounter() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int counter = prefs.getInt('counter') ?? 0;
    prefs.setInt('counter', counter);
  }

}


 class db {

    final Future<Database> database = openDatabase(
      join(await getDatabasesPath(), 'students_database.db'),
      onCreate: (db, version)=>db.execute("CREATE TABLE students(id TEXT PRIMARY KEY, name TEXT, score INTEGER)"),
      onUpgrade: (db, oldVersion, newVersion){
        //dosth for migration
      },
      version: 1,
    );


    // Future<void> insertStudent(Student std) async {
    //   final Database db = await database;
    //   await db.insert(
    //     'students',
    //     std.toJson(),
    //     //插入冲突策略，新的替换旧的
    //     conflictAlgorithm: ConflictAlgorithm.replace,
    //   );
    // }

    // //插入3个Student对象
    // await insertStudent(student1);
    // await insertStudent(student2);
    // await insertStudent(student3);

 }