import 'package:flutter/material.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ListenerExample(),
    );
  }
}

class ListenerExample extends StatefulWidget {
  @override
  _ListenerExampleState createState() => _ListenerExampleState();
}

class _ListenerExampleState extends State<ListenerExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('阻止触摸事件'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[

            // 这两个组件都能阻止子树接收指针事件，不同之处在于AbsorbPointer本身会参与命中测试，
            // 而IgnorePointer本身不会参与，这就意味着 AbsorbPointer 本身是可以接收指针事件的(但其子树不行)，
            // 而 IgnorePointer 不可以。
            Listener(
              child: AbsorbPointer(
                child: Listener(
                  child: Container(
                    color: Colors.red,
                    width: 200.0,
                    height: 100.0,
                  ),
                  onPointerDown: (event)=>print("in"),
                ),
              ),
              onPointerDown: (event)=>print("up"),
            ),
          ],
        ),
      ),
    );
  }
}

