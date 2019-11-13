import 'package:flutter/material.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ConstrainedBoxExample(),
    );
  }
}

class ConstrainedBoxExample extends StatefulWidget {
  @override
  _ConstrainedBoxExampleState createState() => _ConstrainedBoxExampleState();
}

class _ConstrainedBoxExampleState extends State<ConstrainedBoxExample> {
  Widget redBox = DecoratedBox(
    decoration: BoxDecoration(color: Colors.red),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('尺寸限制类容器'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ConstrainedBox(
              constraints: BoxConstraints(
                  minWidth: double.infinity, //宽度尽可能大
                  minHeight: 16.0 //最小高度为50像素
              ),
              child: Container(
                  height: 5.0,
                  child: DecoratedBox(
                    decoration: BoxDecoration(color: Colors.red),
                    child: Text('ConstrainedBox'),
                  )
              ),
            ),

            SizedBox(
                width: 100.0,
                height: 40.0,
                child: Container(
                    height: 5.0,
                    child: DecoratedBox(
                      decoration: BoxDecoration(color: Colors.green),
                      child: Text('给子元素指定固定的宽高'),
                    )
                ),
            ),
            ConstrainedBox(
              constraints: BoxConstraints.tightFor(width: 100.0,height: 40.0),
              child: Container(
                  height: 5.0,
                  child: DecoratedBox(
                    decoration: BoxDecoration(color: Colors.green[400]),
                    child: Text('给子元素指定固定的宽高,等价'),
                  )
              ),
            ),
            ConstrainedBox(
              constraints: BoxConstraints(minHeight: 40.0,maxHeight: 40.0,minWidth: 100.0,maxWidth: 100.0),
              child: Container(
                  height: 5.0,
                  child: DecoratedBox(
                    decoration: BoxDecoration(color: Colors.green[100]),
                    child: Text('给子元素指定固定的宽高,等价'),
                  )
              ),
            ),
          ],
        ),
      ),
    );
  }
}

