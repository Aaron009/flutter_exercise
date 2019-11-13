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
          title: Text('Transform注意事项'),
        ),
        // 先看下面描述
        //
        // 由于第一个Text应用变换(放大)后，其在绘制时会放大，但其占用的空间依然为红色部分，
        // 所以第二个Text会紧挨着红色部分，最终就会出现文字重合。
        //
        // 由于矩阵变化只会作用在绘制阶段，所以在某些场景下，在UI需要变化时，
        // 可以直接通过矩阵变化来达到视觉上的UI改变，而不需要去重新触发build流程，
        // 这样会节省layout的开销，所以性能会比较好。如之前介绍的Flow组件，
        // 它内部就是用矩阵变换来更新UI，除此之外，Flutter的动画组件中也大量使用了Transform以提高性能。
        //
        // 也就是说 绘制阶段是在布局阶段之后的
        body: DecoratedBox(
          decoration: BoxDecoration(color: Colors.grey),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                DecoratedBox(
                    decoration: BoxDecoration(color: Colors.red),
                    child: Transform.scale(
                        scale: 1.5, child: Text("Hello world"))),
                Text(
                  "你好",
                  style: TextStyle(
                      color: Colors.green,
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
        ));
  }
}
