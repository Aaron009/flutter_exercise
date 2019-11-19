import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'i10n/localization_intl.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: IntlExample(),
    );
  }
}

class IntlExample extends StatefulWidget {
  @override
  _IntlExampleState createState() => _IntlExampleState();
}

class _IntlExampleState extends State<IntlExample> {
  DemoLocalizations localizations = DemoLocalizations();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(localizations.title),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(localizations.remainingEmailsMessage(0)),
            Text(localizations.remainingEmailsMessage(1)),
            Text(localizations.remainingEmailsMessage(2)),
            Text(localizations.remainingEmailsMessage(3)),
          ],
        ),
      ),
    );
  }
}

