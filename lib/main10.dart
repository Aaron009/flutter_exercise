// 父Widget管理子Widget的状态

import 'dart:ui';

import 'package:flutter/material.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ParentWidget(),
    );
  }
}
// ParentWidget 为 TapboxB 管理状态.

//------------------------ ParentWidget --------------------------------

class ParentWidget extends StatefulWidget {
  @override
  _ParentWidgetState createState() => new _ParentWidgetState();
}

class _ParentWidgetState extends State<ParentWidget> {
  bool active = false;

  void _handleTapboxChanged() {
    setState(() {
      active = !active;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      child: new TapboxB(
        parentState: this,
      ),
    );
  }
}

//------------------------- TapboxB ----------------------------------

class TapboxB extends StatelessWidget {
  TapboxB({Key key, @required this.parentState})
      : super(key: key);

  final _ParentWidgetState parentState;


  Widget build(BuildContext context) {
    return new GestureDetector(
      onTap: parentState._handleTapboxChanged,
      child: new Container(
        child: new Center(
          child: new Text(
            parentState.active ? 'Active_Example10' : 'Inactive_Example10',
            style: new TextStyle(
                fontSize: 32.0,
                color: Colors.white,
                decorationStyle: TextDecorationStyle.solid),
          ),
        ),
        width: 200.0,
        height: 200.0,
        decoration: new BoxDecoration(
          color: parentState.active ? Colors.lightGreen[700] : Colors.grey[600],
        ),
      ),
    );
  }
}