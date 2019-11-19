
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TestPlatform(),
    );
  }
}

class TestPlatform extends StatefulWidget {
  @override
  _TestPlatformState createState() => _TestPlatformState();
}

class _TestPlatformState extends State<TestPlatform> {
  static const platform = const MethodChannel('com.example.first_app/battery');


  String _batteryLevel = 'Unknown battery level.';

  Future<Null> _getBatteryLevel() async {
    String batteryLevel;
    try {
      final int result = await platform.invokeMethod('getBatteryLevel');
      batteryLevel = 'Battery level at $result % .';
    } on PlatformException catch (e) {
      batteryLevel = "Failed to get battery level: '${e.message}'.";
    }

    setState(() {
      _batteryLevel = batteryLevel;
    });
  }


  @override
  Widget build(BuildContext context) {
    print("打印 ${defaultTargetPlatform.toString()}");

    return Scaffold(
      appBar: AppBar(
        title: Text('测试'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
              Text(defaultTargetPlatform.toString()),

              new RaisedButton(
                child: new Text('Get Battery Level'),
                onPressed: _getBatteryLevel,
              ),
              new Text(_batteryLevel),
          ],
        ),
      ),
    );
  }
}

