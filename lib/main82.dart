import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: NewRouteExample(),
    );
  }
}

class NewRouteExample extends StatefulWidget {
  @override
  _NewRouteExampleState createState() => _NewRouteExampleState();
}

class _NewRouteExampleState extends State<NewRouteExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('路由示例'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FlatButton(
              child: Text("默认路由"),
              textColor: Colors.blue,
              onPressed: () {
                //导航到新路由
                Navigator.push( context,
                    MaterialPageRoute(builder: (context) {
                      return NewRoute();
                    }));
              },
            ),


            FlatButton(
              child: Text("苹果路由"),
              textColor: Colors.blue,
              onPressed: () {
                //导航到新路由
                Navigator.push( context,
                    CupertinoPageRoute(builder: (context) {
                      return NewRoute();
                    }));
              },
            ),

            FlatButton(
              child: Text("自定义路由过渡动画"),
              textColor: Colors.blue,
              onPressed: () {
                //导航到新路由
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    transitionDuration: Duration(milliseconds: 500), //动画时间为500毫秒
                    pageBuilder: (BuildContext context, Animation animation,
                        Animation secondaryAnimation) {
                      return new FadeTransition(
                        //使用渐隐渐入过渡,
                        opacity: animation,
                        child: NewRoute(), //路由B
                      );
                    },
                  ),
                );
              },
            ),

          ],
        ),
      ),
    );
  }
}

class NewRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("New route"),
      ),
      body: Center(
        child: Text("This is new route"),
      ),
    );
  }
}