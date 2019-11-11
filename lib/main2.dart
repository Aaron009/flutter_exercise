import 'package:flutter/material.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Title",
      home: Echo(text: "Hllll",),
    );
  }
}

class Echo extends StatelessWidget {
  final String text;
  final Color backgroundColors;

  const Echo({
    Key key,
    @required this.text,
    this.backgroundColors: Colors.grey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: this.backgroundColors,
        child: Text(this.text),
      ),
    );
  }
}
