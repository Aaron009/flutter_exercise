import 'package:flutter/material.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SelectAndCheckBox(),
    );
  }
}

class SelectAndCheckBox extends StatefulWidget {
  @override
  _SelectAndCheckBoxState createState() => _SelectAndCheckBoxState();
}

class _SelectAndCheckBoxState extends State<SelectAndCheckBox> {
  bool _select = false;  // 这里一定要赋值，否则会为空。
  bool _checkBox = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Switch(
              value: _select,
              onChanged: (value) {
                setState(() {
                  _select = value;
                });
              },
              activeTrackColor: Colors.lightGreenAccent,
              activeColor: Colors.green,
            ),
            Checkbox(
              value: _checkBox,
              tristate: false, // true Checkbox变为三态，其中方块中有一个横
              activeColor: Colors.red, // 选中颜色
              onChanged: (value) {
                setState(() {
                  _checkBox = value;
                });
              },
            )
          ],
        ),
      ),
    );
  }
}
