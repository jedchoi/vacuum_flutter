import 'package:flutter/material.dart';
import 'package:vacuum_flutter/screens/loading_screen.dart';
import 'package:vacuum_flutter/screens/main_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: MainScreen(),
    );
  }
}
