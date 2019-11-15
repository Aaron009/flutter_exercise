import 'package:flutter/material.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AlertExample(),
    );
  }
}

class AlertExample extends StatefulWidget {
  @override
  _AlertExampleState createState() => _AlertExampleState();
}

class _AlertExampleState extends State<AlertExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('底部菜单列表模态对话框'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            RaisedButton(
              child: Text("显示底部菜单列表"),
              onPressed: () async {
                int type = await _showModalBottomSheet();
                print(type);
              },
            ),

            RaisedButton(
              child: Text("弹出一个全屏的菜单列表"),
              onPressed: () async {
                PersistentBottomSheetController<int> type = await _showBottomSheet();
                print(type);
              },
            ),
          ],
        ),
      ),
    );
  }

  // 返回的是一个controller
  PersistentBottomSheetController<int> _showBottomSheet() {
    return showBottomSheet<int>(
      context: context,
      builder: (BuildContext context) {
        return ListView.builder(
          itemCount: 30,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: Text("$index"),
              onTap: (){
                // do something
                print("$index");
                Navigator.of(context).pop();
              },
            );
          },
        );
      },
    );
  }

  // 弹出底部菜单列表模态对话框
  Future<int> _showModalBottomSheet() {
    return showModalBottomSheet<int>(
      context: context,
      builder: (BuildContext context) {
        return ListView.builder(
          itemCount: 30,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: Text("$index"),
              onTap: () => Navigator.of(context).pop(index),
            );
          },
        );
      },
    );
  }


}

