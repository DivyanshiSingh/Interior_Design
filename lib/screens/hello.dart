import 'package:flutter/material.dart';

import 'body1.dart';

class Hello extends StatefulWidget {
  @override
  _HelloState createState() => _HelloState();
}

class _HelloState extends State<Hello> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      color: Colors.white,
      child: Stack(children: <Widget>[
        Center(
            child: Icon(
          Icons.drag_handle,
          size: 70,
        )),
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 585, 20, 40),
          child: SizedBox.expand(
            child: RaisedButton(
              color: Colors.amber,
              textColor: Colors.white,
              // disabledColor: Colors.grey,
              // disabledTextColor: Colors.black,
              padding: EdgeInsets.all(8.0),
              // splashColor: Colors.blueAccent,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Body1(),
                  ),
                );
              },
              child: Text(
                "LETS GET STARTED",
                style: TextStyle(fontSize: 20.0),
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
