import 'package:flutter/material.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: NotificationExample(),
    );
  }
}

class NotificationExample extends StatefulWidget {
  @override
  _NotificationExampleState createState() => _NotificationExampleState();
}

class _NotificationExampleState extends State<NotificationExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notification 通知'),
      ),
      body: NotificationListener(
        onNotification: (notification){
          switch (notification.runtimeType){
            case ScrollStartNotification: print("开始滚动"); break;
            case ScrollUpdateNotification: print("正在滚动"); break;
            case ScrollEndNotification: print("滚动停止"); break;
            case OverscrollNotification: print("滚动到边界"); break;
          }
          return false;
        },
        child: ListView.builder(
            itemCount: 100,
            itemBuilder: (context, index) {
              return ListTile(title: Text("$index"),);
            }
        ),
      ),
    );
  }
}

