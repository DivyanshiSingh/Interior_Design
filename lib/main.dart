import 'package:flutter/material.dart';
import 'package:interiordesign/screens/choice.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.amber),
      home: Choice(),
    );
  }
}
