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
        title: Text('多重尺寸限制'),
      ),
      // 对于minWidth和minHeight来说，是取父子中相应数值较大的。
      // 对于maxWidth和maxHeight，多重限制的策略是什么样的呢？
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ConstrainedBox(
                constraints: BoxConstraints(minWidth: 60.0, minHeight: 60.0), // 父
                child: ConstrainedBox(
                  constraints: BoxConstraints(minWidth: 90.0, minHeight: 20.0),// 子
                  child: redBox,
                )
            )
          ],
        ),
      ),
    );
  }
}

