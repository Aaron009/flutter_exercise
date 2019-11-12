import 'package:flutter/material.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FocusTestRoute(),
    );
  }
}

class FocusTestRoute extends StatefulWidget {
  @override
  _FocusTestRouteState createState() => new _FocusTestRouteState();
}

class _FocusTestRouteState extends State<FocusTestRoute> {
  FocusNode focusNode1 = new FocusNode();
  FocusNode focusNode2 = new FocusNode();
  FocusScopeNode focusScopeNode;

  @override
  void initState() {
    super.initState();

    // 监听焦点变化
    focusNode1.addListener(() {
      print("事件侦听焦点变化 ${focusNode1.hasFocus}");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Container(
        color: Colors.grey,
        constraints: BoxConstraints(minWidth: 230.0, minHeight: 25.0),
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                child: TextField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                        labelText: "Email",
                        hintText: "电子邮件地址",
                        prefixIcon: Icon(Icons.email),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue),
                        ),
                        border: InputBorder.none //隐藏下划线
                    )
                ),
                decoration: BoxDecoration(
                  // 下滑线浅灰色，宽度1像素
//                    border: Border(bottom: BorderSide(color: Colors.grey[200], width: 1.0))
                ),
              ),
//              TextField(
//                autofocus: true,
//                focusNode: focusNode1, //关联focusNode1
//                decoration: InputDecoration(
//                    labelText: "input1",
//                    hintText: "hintText",
//                    prefixIcon: Icon(Icons.person)),
//              ),
//              TextField(
//                  focusNode: focusNode2, //关联focusNode2
//                  decoration: InputDecoration(
//                      labelText: "input2",
//                      hintText: "hintText",
//                      prefixIcon: Icon(Icons.person))),
//              Builder(
//                builder: (ctx) {
//                  return Column(
//                    mainAxisSize: MainAxisSize.min,
//                    children: <Widget>[
//                      RaisedButton(
//                        child: Text("移动焦点"),
//                        onPressed: () {
//                          //将焦点从第一个TextField移到第二个TextField
//                          // 这是一种写法 FocusScope.of(context).requestFocus(focusNode2);
//                          // 这是第二种写法
//                          if (null == focusScopeNode) {
//                            focusScopeNode = FocusScope.of(context);
//                          }
//                          focusScopeNode.requestFocus(focusNode2);
//                        },
//                      ),
//                      RaisedButton(
//                        child: Text("隐藏键盘"),
//                        onPressed: () {
//                          // 当所有编辑框都失去焦点时键盘就会收起
//                          focusNode1.unfocus();
//                          focusNode2.unfocus();
//                        },
//                      ),
//                    ],
//                  );
//                },
//              ),
            ],
          ),
        ),
      )),
    );
  }
}
