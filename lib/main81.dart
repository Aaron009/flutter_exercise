import 'package:flutter/material.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AnimationExample(),
    );
  }
}

class AnimationExample extends StatefulWidget {
  @override
  _AnimationExampleState createState() => _AnimationExampleState();
}

class _AnimationExampleState extends State<AnimationExample>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('动画封装'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            GrowTransition(
              child: Image.asset("images/avatar.png"),
              animation: animation,
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            controller.reset();
            controller.forward();
          }),
    );
  }

  Animation<double> animation;
  AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = new AnimationController(
        duration: const Duration(seconds: 3), vsync: this);
    //图片宽高从0变到300
    animation = new Tween(begin: 0.0, end: 300.0).animate(controller);

    // 有关更多事件
    // https://book.flutterchina.club/chapter9/animation_structure.html
    animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) { // 动画在终点停止
        //动画执行结束时反向执行动画
        controller.reverse();
      } else if (status == AnimationStatus.dismissed) { // 动画在起始点停止
        //动画恢复到初始状态时执行动画（正向）
        controller.forward();
      }
    });

    //启动动画
    controller.forward();
  }
}

class GrowTransition extends StatelessWidget {
  GrowTransition({this.child, this.animation});

  final Widget child;
  final Animation<double> animation;

  Widget build(BuildContext context) {
    return new Center(
      child: new AnimatedBuilder(
          animation: animation,
          builder: (BuildContext context, Widget child) {
            return new Container(
                height: animation.value, width: animation.value, child: child);
          },
          child: child),
    );
  }
}
