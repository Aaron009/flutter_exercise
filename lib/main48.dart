import 'package:flutter/material.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ClipExample(),
    );
  }
}

class ClipExample extends StatefulWidget {
  @override
  _ClipExampleState createState() => _ClipExampleState();
}

class _ClipExampleState extends State<ClipExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("测试Clip，裁剪"),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ClipTestRoute(),
          ],
        ),
      ),
    );
  }
}

class ClipTestRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
// 头像
    Widget avatar = new SizedBox(width: 60, height: 60, child: Image.asset("assets/images/avatar.png", width: 60.0, height: 60, fit: BoxFit.fill),);
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          avatar, //不剪裁
          // 当不出现剪裁圆形时，一定是图片问题，图片周围不能有白边。
          new ClipOval(
            child: new SizedBox(
              width: 60.0,
              height:60.0,
              child:  new Image.network("https://img3.duitang.com/uploads/item/201410/04/20141004184536_c5JXC.thumb.700_0.jpeg", fit: BoxFit.fill,),
            ),
          ),
          ClipOval(child: avatar), //剪裁为圆形
          ClipRRect(
            //剪裁为圆角矩形
            borderRadius: BorderRadius.circular(5.0),
            child: avatar,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Align(
                alignment: Alignment.topLeft,
                widthFactor: .5, //宽度设为原来宽度一半，另一半会溢出
                child: avatar,
              ),
              Text(
                "你好世界",
                style: TextStyle(color: Colors.green),
              )
            ],
          ),
          
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ClipRect(
                //将溢出部分剪裁
                child: Align(
                  alignment: Alignment.topLeft,
                  widthFactor: .5, //宽度设为原来宽度一半
                  child: avatar,
                ),
              ),
              Text("你好世界", style: TextStyle(color: Colors.green))
            ],
          ),
        ],
      ),
    );
  }
}
