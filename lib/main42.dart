import 'dart:math';

import 'package:first_app/main40.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TransformExample(),
    );
  }
}

class TransformExample extends StatefulWidget {
  @override
  _TransformExampleState createState() => _TransformExampleState();
}

class _TransformExampleState extends State<TransformExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transform思考题'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            // 使用Transform对其子组件先进行平移然后再旋转和先旋转再平移，两者最终的效果一样吗？为什么？
//            Transform.translate(
//              offset: Offset(100, 50),
//              child: Transform.rotate(
//                  angle: pi/2,
//                  child: SizedBox(
//                    width: 100,
//                    height: 100,
//                    child:DecoratedBox(
//                      decoration: BoxDecoration(color: Colors.red),
//                    ),
//                  )
//              ),
//            ),

            Padding(
              padding: EdgeInsets.only(top: 0),
              child: Transform.rotate(
                angle: pi/2,
                child: Transform.translate(
                    offset: Offset(100, 50),
                    child: SizedBox(
                      width: 100,
                      height: 100,
                      child:DecoratedBox(
                        decoration: BoxDecoration(color: Colors.red),
                      ),
                    )
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

