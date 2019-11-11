import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: NewStateless(),
    );
  }
}

class NewStateless extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text.rich(
          TextSpan(
          children: [
            TextSpan(
                text: "Home: "
            ),
            TextSpan(
                text: "https://flutterchina.club",
                style: TextStyle(
                    color: Colors.blue
                ),
            ),
          ]
      ), style: TextStyle(fontSize: 16),),

    );
  }
}
