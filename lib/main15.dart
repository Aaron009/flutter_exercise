import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'fonts/MyIcons.dart';

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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(bottom: 5),
                child: Image(
                    image: AssetImage("assets/images/avatar.png"),
                    width: 100.0),
              ),

              // 快捷方法
              Padding(
                  padding: EdgeInsets.only(bottom: 5),
                  child: Image.asset(
                    "assets/images/avatar.png",
                    width: 100.0,
                  )),

              Image(
                image: NetworkImage("https://www.baidu.com/img/bd_logo1.png"),
                width: 100.0,
              ),

              Image.network(
                "https://avatars2.githubusercontent.com/u/20411648?s=460&v=4",
                width: 100.0,
              ),

              Text(
                "" +
// accessible: &#xE914; or 0xE914 or E914
                    "\uE914" +
// error: &#xE000; or 0xE000 or E000
                    " \uE000" +
// fingerprint: &#xE90D; or 0xE90D or E90D
                    " \uE90D",
                style: TextStyle(
                    fontFamily: "MaterialIcons",
                    fontSize: 24.0,
                    color: Colors.green),
              ),

              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(Icons.accessible,color: Colors.green,),
                  Icon(Icons.threed_rotation,color: Colors.red,),
                  Icon(Icons.error,color: Colors.green,),
                  Icon(Icons.fingerprint,color: Colors.green,),

//                  Icon(MyIcons.book,color: Colors.purple,),
//                  Icon(MyIcons.wechat,color: Colors.green,),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
