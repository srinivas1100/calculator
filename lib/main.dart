import 'package:calculator/calculator.dart';
import 'package:flutter/material.dart';

void main() {
 // await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'calculator',
      home: Calculator(),
    );
  }
}
