import 'dart:math';

import 'package:flutter/material.dart';

import 'CommentTest.dart';
import 'main96.dart' as main96;
void main() {
//  runApp(MyApp());
  runApp(main96.MainApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MyAppState();
  }
}

class MyAppState extends StatefulWidget {
  MyAppState({Key key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyAppState> {
  var imgURL = 'https://picsum.photos/250?image=9';

  @override
  Widget build(BuildContext context) {
    var title = 'Web Images';
    print("build");
    return MaterialApp(
      title: title,
      home: CommentTest(),
//      home: Scaffold(
//        appBar: AppBar(
//          title: Text(title),
//        ),
//        body: Column(children: <Widget>[
//          Image.network(
//            imgURL,
//          ),
//          Text.rich(
//            TextSpan(
//              children: [
//                TextSpan(
//                  text: imgURL,
////                  style: TextStyle(
////                    color: Colors.blue,
////                    fontSize: 24,
////                    fontStyle: FontStyle.italic,
////                  ),
//                ),
//              ],
//            ),
//          ),
//        ]),
//        floatingActionButton: FloatingActionButton(
//          onPressed: _sendMessage,
//          tooltip: 'Send message',
//          child: Icon(Icons.send),
//        ),
//      ),
    );
  }

  void _sendMessage() {
    var random = Random();
    imgURL = 'https://picsum.photos/250?image=' + random.nextInt(10).toString();

    setState(() {
//      imgURL = imgURL;
    });
  }
}
