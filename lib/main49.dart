import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SingleChildScrollViewExample(),
    );
  }
}

class SingleChildScrollViewExample extends StatefulWidget {
  @override
  _SingleChildScrollViewExampleState createState() => _SingleChildScrollViewExampleState();
}

class _SingleChildScrollViewExampleState extends State<SingleChildScrollViewExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('滚动视图之SingleChildScrollView'),
      ),
      // SingleChildScrollView不支持基于Sliver的延迟实例化模型，
      // 所以如果预计视口可能包含超出屏幕尺寸太多的内容时，
      // 那么使用SingleChildScrollView将会非常昂贵（性能差），
      // 此时应该使用一些支持Sliver延迟加载的可滚动组件，如ListView。
      //

      //示例
      body: SingleChildScrollViewTestRoute(),
    );
  }
}

class SingleChildScrollViewTestRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String str = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    // 自动判断，如果是IOS设置，自动切换到ios的滚动条
    return CupertinoScrollbar( // 显示进度条 Scrollbar ios CupertinoScrollbar
      child: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            //动态创建一个List<Widget>
            children: str.split("")
            //每一个字母都用一个Text显示,字体为原来的两倍
                .map((c) => Text(c, textScaleFactor: 2.0,))
                .toList(),
          ),
        ),
      ),
    );
  }
}