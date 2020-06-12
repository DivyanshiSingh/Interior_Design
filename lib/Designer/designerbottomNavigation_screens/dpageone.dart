import 'package:flutter/material.dart';

class DPageone extends StatefulWidget {
  @override
  _DPageoneState createState() => _DPageoneState();
}

class _DPageoneState extends State<DPageone> {
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
