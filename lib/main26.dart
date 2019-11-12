import 'package:flutter/material.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ColumnMaxWidth(),
    );
  }
}

class ColumnMaxWidth extends StatefulWidget {
  @override
  _ColumnMaxWidthState createState() => _ColumnMaxWidthState();
}

class _ColumnMaxWidthState extends State<ColumnMaxWidth> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("使用expaned解决Clumn特殊情况"),
      ),
      // 发生嵌套时，只有最外面的 Column 和 Row，才会尽可能占用最大空间，而内部占用实际大小空间。
      body: Container(
        color: Colors.green,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max, //有效，外层Colum高度为整个屏幕
            children: <Widget>[
              Expanded( //使用expaned解决Clumn特殊情况
                  child:Container(
                    color: Colors.red,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        Text("hello world "),
                        Text("I am Jack "),
                      ],
                    ),
                  )
              )
            ],
          ),
        ),
      ),
    );
  }
}
