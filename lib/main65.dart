import 'package:flutter/material.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ThemeExample(),
    );
  }
}

class ThemeExample extends StatefulWidget {
  @override
  _ThemeExampleState createState() => _ThemeExampleState();
}

class _ThemeExampleState extends State<ThemeExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("主题"),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            //背景为蓝色，则title自动为白色
            NavBar(color: Colors.blue, title: "标题"),
            //背景为白色，则title自动为黑色
            NavBar(color: Colors.white, title: "标题"),

            NavBar(color: Color(0xffdc380d), title: "标题"),  //如果颜色固定可以直接使用整数值
            NavBar(color: Color(int.parse("00ff00", radix:16) | 0xFF000000), title: "标题"),  //通过位运算符将Alpha设置为FF
            NavBar(color: Color(int.parse("0000ff", radix:16)).withAlpha(255), title: "标题"),  //通过方法将Alpha设置为FF
          ],
        ),
      ),
    );
  }
}

class NavBar extends StatelessWidget {
  final String title;
  final Color color; //背景颜色

  NavBar({
    Key key,
    this.color,
    this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        minHeight: 52,
        minWidth: double.infinity,
      ),
      decoration: BoxDecoration(
        color: color,
        boxShadow: [
          //阴影
          BoxShadow(
            color: Colors.black26,
            offset: Offset(0, 3),
            blurRadius: 3,
          ),
        ],
      ),
      child: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          //根据背景色亮度来确定Title颜色
          color: color.computeLuminance() < 0.5 ? Colors.white : Colors.black,
        ),
      ),
      alignment: Alignment.center,
    );
  }
}



