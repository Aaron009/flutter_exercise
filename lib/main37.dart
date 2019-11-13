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
      appBar:AppBar(
        title: Text('取消尺寸限制'),
        actions: <Widget>[
          // 这里需要注意这个。
          // 在实际开发中，当我们发现已经使用SizedBox或ConstrainedBox给子元素指定了宽高，
          // 但是仍然没有效果时，几乎可以断定：已经有父元素已经设置了限制！
          // 改造方式，请看main38
          SizedBox(
            width: 20,
            height: 20,
            child: CircularProgressIndicator(
              strokeWidth: 3,
              valueColor: AlwaysStoppedAnimation(Colors.white70),
            ),
          )
        ],
      ),

      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            // UnconstrainedBox对父组件限制的“去除”并非是真正的去除：上面例子中虽然红色区域大小是90×20，
            // 但上方仍然有80的空白空间。也就是说父限制的minHeight(100.0)仍然是生效的，
            // 只不过它不影响最终子元素redBox的大小，但仍然还是占有相应的空间，
            // 可以认为此时的父ConstrainedBox是作用于子UnconstrainedBox上，
            // 而redBox只受子ConstrainedBox限制，
            ConstrainedBox(
                constraints: BoxConstraints(minWidth: 60.0, minHeight: 100.0),  //父
                child: UnconstrainedBox( //“去除”父级限制
                  child: ConstrainedBox(
                    constraints: BoxConstraints(minWidth: 100.0, minHeight: 20.0),//子
                    child: redBox,
                  ),
                )
            ),
            ConstrainedBox(
              constraints: BoxConstraints(minWidth: 100.0, minHeight: 20.0),//子
              child: DecoratedBox(
                decoration: BoxDecoration(color: Colors.green),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

