class User {

  String name;
  int age;
  String job;

  // //默认构造方法，赋值给name和tag
  User(this.name, this.age, this.job);

  // //返回一个空的ModelA
  User.empty();
  
  //返回一个设置了name的ModelA
  User.withName(this.name);

}