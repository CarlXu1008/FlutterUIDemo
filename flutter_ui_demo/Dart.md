# Dart语言基础语法



### mportant concepts（重要的概念）

在学习 Dart 的时候，请牢记下面一些事实和 概念：

- 所有能够使用变量引用的都是对象， 每个对象都是一个类的实例。在 Dart 中 甚至连 数字、方法和 null 都是对象。所有的对象都继承于 Object 类。

- 使用静态类型(例如前面示例中的 num ) 可以更清晰的表明你的意图，并且可以让静态分析工具来分析你的代码， 但这并不是牵制性的。（在调试代码的时候你可能注意到 没有指定类型的变量的类型为 dynamic。）

- Dart 在运行之前会先解析你的代码。你可以通过使用 类型或者编译时常量来帮助 Dart 去捕获异常以及 让代码运行的更高效。

- Dart 支持顶级方法 (例如 main())，同时还支持在类中定义函数。 （静态函数和实例函数）。 你还可以在方法中定义方法 （嵌套方法或者局部方法）。

- 同样，Dart 还支持顶级变量，以及 在类中定义变量（静态变量和实例变量）。 实例变量有时候被称之为域（Fields）或者属性（Properties）。

- 和 Java 不同的是，Dart 没有 public、 protected、 和 private 关键字。如果一个标识符以 (_) 开头，则该标识符 在库内是私有的。详情请参考： 库和可见性。

- 标识符可以以字母或者 _ 下划线开头，后面可以是 其他字符和数字的组合。

- 有时候 表达式 expression 和 语句 statement 是有区别的，所以这种情况我们会分别指明每种情况。

- Dart 工具可以指出两种问题：警告和错误。 警告只是说你的代码可能有问题， 但是并不会阻止你的代码执行。 错误可以是编译时错误也可以是运行时错误。遇到编译时错误时，代码将 无法执行；运行时错误将会在运行代码的时候导致一个 异常。


### Built-in types(内置的类型)
Dart 内置支持下面这些类型：
- numbers
- strings
- booleans
- lists (也被称之为 arrays)
- maps
- runes (用于在字符串中表示 Unicode 字符)
- symbols

### 变量

- var 可以定义变量，如 var tag = "666"，这和JS语言类似，同时Dart属于伪动态强类型语言，支持闭包。    
- Dart 中 number 类型分为 int 和 double， Dart 中没有 float 类型。
- Dart 下只有 bool 型可以用于 if 等判断，不同于 JS 这种使用方式是不合法的 var g = "null"; if(g){} 。 
- DART中，switch 支持 String 类型。
- Dart 不需要给变量设置 setter getter方法。Dart 中所有的基础类型、类等都继承 Object ，默认值是 NULL， 自带 getter 和 setter ，而如果是 final 或者 const 的话，那么它只有一个 getter 方法。
- Dart 中 final 和 const 表示常量，比如 final name = 'GSY'; const value= 1000000; 同时 static const 组合代表了静态常量。其中 const 的值在编译期确定，final 的值要到运行时才确定。（ps Flutter 在 Release 下是 AOT 模式。）
- Dart 下的数值，在作为字符串使用时，是需要显式指定的。比如：int i = 0; print("aaaa" + i); 这样并不支持，需要 print("aaaa" + i.toString()); 这样使用。这和 Java 与 JS 存在差异。所以在使用动态类型时，需要注意不要把 number 类型当做 String 使用。
- DART 中数组等于列表，所以 var list = []; 和 List list = new List() 可以简单看做一样。

##### Default value（默认值）
没有初始化的变量自动获取一个默认值为 null。类型为数字的 变量如何没有初始化其值也是 null，不要忘记了 数字类型也是对象。

##### Optional types（可选的类型）
```
在声明变量的时候，你可以选择加上具体 类型：
String name = 'Bob';
添加类型可以更加清晰的表达你的意图。 IDE 编译器等工具有可以使用类型来更好的帮助你， 可以提供代码补全、提前发现 bug 等功能。
```

###### Runes
在 Dart 中，runes 代表字符串的 UTF-32 code points。String类型是UTF-16编码的.
Unicode 为每一个字符、标点符号、表情符号等都定义了 一个唯一的数值。

##### Symbols
一个 Symbol object 代表 Dart 程序中声明的操作符或者标识符。 你也许从来不会用到 Symbol，但是该功能对于通过名字来引用标识符的情况 是非常有价值的，特别是混淆后的代码， 标识符的名字被混淆了，但是 Symbol 的名字不会改变。
使用 Symbol 字面量来获取标识符的 symbol 对象，也就是在标识符 前面添加一个 # 符号：
```
#radix
#bar
```


### 方法

- Dart 是一个真正的面向对象语言，方法也是对象并且具有一种 类型， Function。 这意味着，方法可以赋值给变量，也可以当做其他方法的参数。 也可以把 Dart 类的实例当做方法来调用。

```
class ModelA {
  String name;
  String tag;
  
  //默认构造方法，赋值给name和tag
  ModelA(this.name, this.tag);

  //返回一个空的ModelA
  ModelA.empty();
  
  //返回一个设置了name的ModelA
  ModelA.forName(this.name);
}

```

- 对于只有一个表达式的方法，你可以选择 使用缩写语法来定义：
```
 bool isNoble(int atomicNumber) => _nobleGases[atomicNumber] != null;
```
这个 => expr 语法是 { return expr; } 形式的缩写。=> 形式 有时候也称之为 胖箭头 语法。

- Optional positional parameters（可选位置参数）
把一些方法的参数放到 [] 中就变成可选 位置参数了：
```
String say(String from, String msg, [String device]) {
  var result = '$from says $msg';
  if (device != null) {
    result = '$result with a $device';
  }
  return result;
}
```

- Default parameter values（默认参数值）
```
/// Sets the [bold] and [hidden] flags to the values you
/// specify, defaulting to false.
void enableFlags({bool bold = false, bool hidden = false}) {
  // ...
}

// bold will be true; hidden will be false.
enableFlags(bold: true);
```

- 级联调用（cascade

```
void main() {
  querySelector("#sample_text_id")
    ..text = "Click me!"
    ..onClick.listen(reverseText);
}
```

- Anonymous functions（匿名方法）
> 大部分方法都带有名字，例如 main() 或者 printElement()。 你有可以创建没有名字的方法，称之为 匿名方法，有时候也被称为 lambda 或者 closure 闭包。

```
([[Type] param1[, …]]) { 
  codeBlock; 
}; 
```

- Assignment operators（赋值操作符）

> 使用 = 操作符来赋值。 但是还有一个 ??= 操作符用来指定 值为 null 的变量的值。


- Assert（断言）
如果条件表达式结果不满足需要，则可以使用 assert 语句俩打断代码的执行。

```
// Make sure the variable has a non-null value.
assert(text != null);

// Make sure the value is less than 100.
assert(number < 100);

// Make sure this is an https URL.
assert(urlString.startsWith('https'));
```

> 注意： 断言只在检查模式下运行有效，如果在生产模式 运行，则断言不会执行。

- Finally (对标Swif的关键字defer)
> 要确保某些代码执行，不管有没有出现异常都需要执行，可以使用 一个 finally 语句来实现。如果没有 catch 语句来捕获异常， 则在执行完 finally 语句后， 异常被抛出了
> Swif关键字defer: [https://www.jianshu.com/p/a71d87d92459]

```
try {
  breedMoreLlamas();
} catch(e) {
  print('Error: $e');  // Handle the exception first.
} finally {
  cleanLlamaStalls();  // Then clean up.
}
```

### Classes

> Dart 是一个面向对象编程语言，同时支持基于 mixin 的继承机制。 每个对象都是一个类的实例，所有的类都继承于 Object.。 基于 Mixin 的继承 意味着每个类（Object 除外） 都只有一个超类，一个类的代码可以在其他 多个类继承中重复使用。

> 注意：构造函数不能继承，所以超类的命名构造函数 也不会被继承。如果你希望 子类也有超类一样的命名构造函数， 你必须在子类中自己实现该构造函数。


#####  Factory constructors（工厂方法构造函数）

如果一个构造函数并不总是返回一个新的对象，则使用 factory 来定义 这个构造函数。

```
class Logger {
  final String name;
  bool mute = false;

  // _cache is library-private, thanks to the _ in front
  // of its name.
  static final Map<String, Logger> _cache =
      <String, Logger>{};

  factory Logger(String name) {
    if (_cache.containsKey(name)) {
      return _cache[name];
    } else {
      final logger = new Logger._internal(name);
      _cache[name] = logger;
      return logger;
    }
  }

  Logger._internal(this.name);

  void log(String msg) {
    if (!mute) {
      print(msg);
    }
  }
}
```

#####  Getters and setters
Getters 和 setters 是用来设置和访问对象属性的特殊 函数。每个实例变量都隐含的具有一个 getter， 如果变量不是 final 的则还有一个 setter。 你可以通过实行 getter 和 setter 来创建新的属性， 使用 get 和 set 关键字定义 getter 和 setter：


```
class Rectangle {
  num left;
  num top;
  num width;
  num height;

  Rectangle(this.left, this.top, this.width, this.height);

  // Define two calculated properties: right and bottom.
  num get right             => left + width;
      set right(num value)  => left = value - width;
  num get bottom            => top + height;
      set bottom(num value) => top = value - height;
}

main() {
  var rect = new Rectangle(3, 4, 20, 15);
  assert(rect.left == 3);
  rect.right = 12;
  assert(rect.left == -8);
}
```


### Abstract classes

> 抽象函数是只定义函数接口但是没有实现的函数，由子类来 实现该函数。

```
abstract class Doer {
  // ...Define instance variables and methods...

  void doSomething(); // Define an abstract method.
}

class EffectiveDoer extends Doer {
  void doSomething() {
    // ...Provide an implementation, so the method is not abstract here...
  }
}
```
> 注意：调用一个没实现的抽象函数会导致运行时异常。


##### Overridable operators（可覆写的操作符
 例如，如果你定义了一个 Vector 类， 你可以定义一个 + 函数来实现两个向量相加

```
class Vector {
  final int x;
  final int y;
  const Vector(this.x, this.y);

  /// Overrides + (a + b).
  Vector operator +(Vector v) {
    return new Vector(x + v.x, y + v.y);
  }

  /// Overrides - (a - b).
  Vector operator -(Vector v) {
    return new Vector(x - v.x, y - v.y);
  }
}

main() {
  final v = new Vector(2, 3);
  final w = new Vector(2, 2);

  // v == (2, 3)
  assert(v.x == 2 && v.y == 3);

  // v + w == (4, 5)
  assert((v + w).x == 4 && (v + w).y == 5);

  // v - w == (0, 1)
  assert((v - w).x == 0 && (v - w).y == 1);
}
```

##### Implicit interfaces（隐式接口）

Dart 没有 interface 关键字。在 Dart 中所有的类都隐含的定义了一个接口。因此你可以使用 implement 来实现任意的类隐含定义的接口。
> 每个类都隐式的定义了一个包含所有实例成员的接口， 并且这个类实现了这个接口。如果你想 创建类 A 来支持 类 B 的 api，而不想继承 B 的实现， 则类 A 应该实现 B 的接口。


```
// A person. The implicit interface contains greet().
class Person {
  // In the interface, but visible only in this library.
  final _name;

  // Not in the interface, since this is a constructor.
  Person(this._name);

  // In the interface.
  String greet(who) => 'Hello, $who. I am $_name.';
}

// An implementation of the Person interface.
class Imposter implements Person {
  // We have to define this, but we don't use it.
  final _name = "";

  String greet(who) => 'Hi $who. Do you know who I am?';
}

greetBob(Person person) => person.greet('bob');

main() {
  print(greetBob(new Person('kathy')));
  print(greetBob(new Imposter()));
}


下面是实现多个接口 的示例：
class Point implements Comparable, Location {
  // ...
}

```

##### ### Mixins（为类添加新的功能）

> Mixins 是在多类继承体系中重用代码的一种方式。使用 with 关键字后面为一个或者多个 mixin 名字来使用 mixin。 下面是示例显示了如何使用 mixin：

```
class Musician extends Performer with Musical {
  // ...
}

class Maestro extends Person
    with Musical, Aggressive, Demented {
  Maestro(String maestroName) {
    name = maestroName;
    canConduct = true;
  }
}
```

### Generics（泛型）

> 一个使用泛型的原因是减少重复的代码。 泛型可以在多种类型之间定义同一个实现， 同时还可以继续使用检查模式和静态分析工具提供的代码分析功能。


### Imports

```
// Importing core libraries
import 'dart:async';
import 'dart:math';

// Importing libraries from external packages
import 'package:angular2/angular2.dart';

// Importing files
import 'path/to/my_other_file.dart';
```


### Asynchrony support（异步支持）

Dart 有一些语言特性来支持 异步编程。 最常见的特性是 async 方法和 await 表达式。
Dart 库中有很多返回 Future 或者 Stream 对象的方法。 这些方法是 异步的： 这些函数在设置完基本的操作 后就返回了， 而无需等待操作执行完成。 例如读取一个文件，在打开文件后就返回了。
有两种方式可以使用 Future 对象中的 数据：
- 使用 async 和 await
- 使用 Future API

使用 async 和 await 的代码是异步的， 但是看起来有点像同步代码。 例如，下面是一些使用 await 来 等待异步方法返回的示例：

```
checkVersion() async {
  var version = await lookUpVersion();
  if (version == expectedVersion) {
    // Do something.
  } else {
    // Do something else.
  }
}
```

可以使用 try, catch, 和 finally 来处理使用 await 的异常：

```
try {
  server = await HttpServer.bind(InternetAddress.LOOPBACK_IP_V4, 4044);
} catch (e) {
  // React to inability to bind to the port...
}
```

### Callable classes（可调用的类）
如果 Dart 类实现了 call() 函数则 可以当做方法来调用。


### Isolates
现代的浏览器以及移动浏览器都运行在多核 CPU 系统上。 要充分利用这些 CPU，开发者一般使用共享内存 数据来保证多线程的正确执行。然而， 多线程共享数据通常会导致很多潜在的问题，并导致代码运行出错。

所有的 Dart 代码在 isolates 中运行而不是线程。 每个 isolate 都有自己的堆内存，并且确保每个 isolate 的状态都不能被其他 isolate 访问。

### Typedefs

在 Dart 语言中，方法也是对象。 使用 typedef, 或者 function-type alias 来为方法类型命名， 然后可以使用命名的方法。 当把方法类型赋值给一个变量的时候，typedef 保留类型信息。


```
typedef int Compare(Object a, Object b);

class SortedCollection {
  Compare compare;

  SortedCollection(this.compare);
}

 // Initial, broken implementation.
 int sort(Object a, Object b) => 0;

main() {
  SortedCollection coll = new SortedCollection(sort);
  assert(coll.compare is Function);
  assert(coll.compare is Compare);
}
```

> 注意： 目前，typedefs 只能使用在 function 类型上，但是将来 可能会有变化。


### Metadata（元数据）
使用元数据给你的代码添加其他额外信息。 元数据注解是以 @ 字符开头，后面是一个编译时 常量(例如 deprecated)或者 调用一个常量构造函数。

有三个注解所有的 Dart 代码都可以使用： @deprecated、 @override、 和 @proxy。关于 @override 和 @proxy 示例请参考 Extending a class。 下面是使用 @deprecated 的 示例：


```
class Television {
  /// _Deprecated: Use [turnOn] instead._
  @deprecated
  void activate() {
    turnOn();
  }

  /// Turns the TV's power on.
  void turnOn() {
    print('on!');
  }
}
```

### Effective Dart 

- 代码风格指南 – 规定了如何格式化代码— dartfmt 的实现使用同样的规则。同样还指定了如何 格式化标识符：camelCase、 using_underscores、等。

- 文档注释指南 – 告诉你关于如何编写注释文档的一切内容。 包含代码文档注释、 普通注释。

- 最佳实践指南 – 告诉你如何使用语言提供的特性来实现你的功能。 如果是关于语句和表达式的，则 会在这里介绍。

- API设计指南 – 这个指南最宽松，但是应用面最广。 涵盖了如何设计一致的、可用的 API。 关于方法返回何种类型、如何定义 等内容在这里会介绍。

> 高效的编码规范：http://dart.goodev.org/guides/language/effective-dart



### 参考文档

> Dart中文网： http://dart.goodev.org/guides/language/language-tour



