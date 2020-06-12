import 'package:flutter/material.dart';

class Pageone extends StatefulWidget {
  @override
  _PageoneState createState() => _PageoneState();
}

class _PageoneState extends State<Pageone> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        color: Colors.white,
        child: Image.asset('lib/images/parachute.jpg'),
      ),
    );
  }
}
