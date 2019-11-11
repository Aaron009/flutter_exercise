import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: NewStateless(),
    );
  }
}

class NewStateless extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Container(
        color: Colors.grey,
        child: Align(
          alignment: Alignment.center,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              RaisedButton(  // 即"漂浮"按钮，它默认带有阴影和灰色背景。按下后，阴影会变大
                child: Text("RaisedButton normal"),
                onPressed: () {},
              ),
              FlatButton( // 即扁平按钮，默认背景透明并不带阴影。按下后，会有背景色
                child: Text("FlatButton normal"),
                onPressed: () {},
              ),
              OutlineButton( // 默认有一个边框，不带阴影且背景透明。按下后，边框颜色会变亮、同时出现背景和阴影(较弱)
                child: Text("OutlineButton normal"),
                onPressed: () {},
              ),
              IconButton( // 是一个可点击的Icon，不包括文字，没有背景
                icon: Icon(Icons.thumb_up),
                onPressed: () {},
              ),

              // RaisedButton、FlatButton、OutlineButton都有一个icon 构造函数，通过它可以轻松创建带图标的按钮
              RaisedButton.icon(
                icon: Icon(Icons.send),
                label: Text("发送"),
                onPressed: (){},
              ),
              OutlineButton.icon(
                icon: Icon(Icons.add),
                label: Text("添加"),
                onPressed: (){},
              ),
              FlatButton.icon(
                icon: Icon(Icons.info),
                label: Text("详情"),
                onPressed: (){},
              ),

              // 自定义按钮
              // 详细 https://book.flutterchina.club/chapter3/buttons.html
              RaisedButton(
                color: Colors.blue,
                highlightColor: Colors.blue[700],
                colorBrightness: Brightness.dark,
                splashColor: Colors.grey,
                child: Text("Submit"),
                shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
