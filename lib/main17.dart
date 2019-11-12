import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      home: TextFieldExample(),
    );
  }
}

class TextFieldExampleState extends State<TextFieldExample> {
  TextEditingController _userEditorControl = new TextEditingController();
  TextEditingController _passwordEditorControl = new TextEditingController();

  @override
  void initState() {
    super.initState();

    _userEditorControl.addListener(() {
      print("通过事件侦听 ${[_userEditorControl.text]}");

//      _userEditorControl.text = "hello world!"; // 初始化文本 不能写在改变change的地方，否则会导致递归
      _userEditorControl.selection = TextSelection( // 选中文本
          baseOffset: 2, extentOffset: _userEditorControl.text.length);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            TextField(
              autofocus: true,
              decoration: InputDecoration(
                  labelText: "用户名",
                  hintText: "输入用户账号",
                  prefixIcon: Icon(Icons.person)),
              controller: _userEditorControl,
              onChanged: (value) {
                print("通过change获取输入内容 $value");
              },
            ),
            TextField(
              decoration: InputDecoration(
                labelText: "密码",
                hintText: "输入密码",
                prefixIcon: Icon(Icons.lock),
              ),
              obscureText: true,
              controller: _passwordEditorControl,
            )
          ],
        ),
      ),
    );
  }
}

class TextFieldExample extends StatefulWidget {
  @override
  TextFieldExampleState createState() => new TextFieldExampleState();
}
