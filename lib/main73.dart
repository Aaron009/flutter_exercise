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
        title: Text('Loading弹窗'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            RaisedButton(
                child: Text('Loading弹窗'),
                onPressed: () {
                  showLoadingDialog(context);
                },
            ),

            // 如果我们嫌Loading框太宽，想自定义对话框宽度，
            // 这时只使用SizedBox或ConstrainedBox是不行的，
            // 原因是showDialog中已经给对话框设置了宽度限制，
            // 根据我们在第五章“尺寸限制类容器”一节中所述，
            // 我们可以使用UnconstrainedBox先抵消showDialog对宽度的限制，
            // 然后再使用SizedBox指定宽度
            RaisedButton(
              child: Text('Loading弹窗,宽度小一点的'),
              onPressed: () {
                showLoadingDialog2(context);
              },
            ),

          ],
        ),
      ),
    );
  }
}

showLoadingDialog(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false, //点击遮罩不关闭对话框
    builder: (context) {
      return AlertDialog(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            CircularProgressIndicator(),
            Padding(
              padding: const EdgeInsets.only(top: 26.0),
              child: Text("正在加载，请稍后..."),
            )
          ],
        ),
      );
    },
  );
}

showLoadingDialog2(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false, //点击遮罩不关闭对话框
    builder: (context) {
      return AlertDialog(
        contentPadding: EdgeInsets.only(top:10, bottom: 10),
        content: UnconstrainedBox(
          constrainedAxis: Axis.vertical,
          child: SizedBox(
            width: 150,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                CircularProgressIndicator(),
                Padding(
                  padding: const EdgeInsets.only(top: 0.0),
                  child: Text("正在加载，请稍后..."),
                )
              ],
            ),
          ),
        ),
      );
    },
  );
}

