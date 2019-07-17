# flutter_ui_demo

A new Flutter application.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.


参考链接： https://github.com/yang7229693/flutter-study

## Flutter基本命令

##### 1.创建项目
> flutter create project_name

> cd project_name 

##### 2.显示本机的模拟器
>  flutter emulators

##### 3、启动本机的模拟器
> flutter emulator --launch apple_ios_simulator

##### 4、远程更新package
> flutter packages get

##### 5、运行应用到模拟器上
> flutter run

如果想指定运行的平台，可以指定参数：

> flutter run -d android

> flutter run -d iPhone

也可以同时运行：

> flutter run -d all

Release模式（只能在真机上运行，不能在模拟器上运行）

> flutter run --release

创建release版本打包发布

> flutter build ios

##### 6、热重载
- 先保存代码commad+s
- 然后在 terminal中输入r
- 执行后界面内容更新

##### 7、停止运行
> control+z

##### 拉取声明的第三方库到本地工程
> flutter packages get

##### VSCode中常用的快捷键
- R 键重新启动
- r 键热重载
- q 退出
- p 显示网格
- P 显示帧率
- o 切换Android与iOS的预览模式

