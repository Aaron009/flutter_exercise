import 'package:flutter/material.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ProgressRoute(),
    );
  }
}

class ProgressRoute extends StatefulWidget {
  @override
  _ProgressRouteState createState() => _ProgressRouteState();
}

class _ProgressRouteState extends State<ProgressRoute>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;

  @override
  void initState() {
    //动画执行时间3秒
    _animationController =
        new AnimationController(vsync: this, duration: Duration(seconds: 3));
    _animationController.forward();
    _animationController.addListener(() => setState(() => {}));
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            GestureDetector (
              onTap: () {
                setState(() {
                  _animationController.reset();
                  _animationController.forward();
                });
              },
              child: Padding(
                padding: EdgeInsets.all(16),
                child: LinearProgressIndicator(
                  backgroundColor: Colors.grey[200],
                  valueColor: ColorTween(begin: Colors.grey, end: Colors.blue)
                      .animate(_animationController), // 从灰色变成蓝色
                  value: _animationController.value,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
