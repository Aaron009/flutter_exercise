import 'package:flutter/material.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ListenExample(),
    );
  }
}

class ListenExample extends StatefulWidget {
  @override
  _ListenExampleState createState() => _ListenExampleState();
}

class _ListenExampleState extends State<ListenExample> {
  //定义一个状态，保存当前指针位置
  PointerEvent _event;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('事件侦听'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Listener(
              child: Container(
                alignment: Alignment.center,
                color: Colors.blue,
                width: 300.0,
                height: 150.0,
                child: Text(_event?.toString()??"",style: TextStyle(color: Colors.white)),
              ),
              onPointerDown: (PointerDownEvent event) => setState(()=>_event=event),
              onPointerMove: (PointerMoveEvent event) => setState(()=>_event=event),
              onPointerUp: (PointerUpEvent event) => setState(()=>_event=event),
            ),

            Listener(
                child: ConstrainedBox(
                  constraints: BoxConstraints.tight(Size(300.0, 150.0)),
                  child: Center(child: Text("Box A")),
                ),
                behavior: HitTestBehavior.opaque, // 注意，该属性并不能用于在组件树中拦截（忽略）事件，它只是决定命中测试时的组件大小。
                onPointerDown: (event) => print("down A")
            ),

            Stack(
              children: <Widget>[
                Listener(
                  child: ConstrainedBox(
                    constraints: BoxConstraints.tight(Size(300.0, 200.0)),
                    child: DecoratedBox(
                        decoration: BoxDecoration(color: Colors.blue)),
                  ),
                  onPointerDown: (event) => print("down0"),
                ),
                Listener(
                  child: ConstrainedBox(
                    constraints: BoxConstraints.tight(Size(200.0, 100.0)),
                    child: Center(child: Text("左上角200*100范围内非文本区域点击")),
                  ),
                  onPointerDown: (event) => print("down1"),
                  behavior: HitTestBehavior.translucent, //放开此行注释后可以"点透"
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

