import 'package:flutter/material.dart';

void main() {
  runApp(MainAPP());
}

class MainAPP extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "标题",
      home: Echo(text: "Hello WWWW"),
    );
  }
}

class Echo extends StatelessWidget {
  final String text;

  final Color backgroundColor;

  const Echo({
    Key key,
    @required this.text,
    this.backgroundColor: Colors.grey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: this.backgroundColor,
        child: Text(this.text),
      ),
    );
  }
}
