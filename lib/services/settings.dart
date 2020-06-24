import 'package:flutter/material.dart';
import 'package:interiordesign/screens/login.dart';
import '../services/feedback.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        elevation: 0.1,
        backgroundColor: Colors.amber,
        title: Text(
          'Settings',
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.height,
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 30),
            Divider(),
            SizedBox(
              height: 30,
              width: MediaQuery.of(context).size.width,
              child: FlatButton(
                color: Colors.white,
                padding: EdgeInsets.all(2.0),
                onPressed: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => Home(),
                  //   ),
                  // );
                },
                child: Text(
                  "Account",
                  style: TextStyle(fontSize: 15.0, color: Colors.grey[700]),
                ),
              ),
            ),
            Divider(),
            SizedBox(
              height: 30,
              width: MediaQuery.of(context).size.width,
              child: FlatButton(
                color: Colors.white,
                textColor: Colors.grey,
                padding: EdgeInsets.all(2.0),
                onPressed: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => Home(),
                  //   ),
                  // );
                },
                child: Text(
                  "Help",
                  style: TextStyle(fontSize: 15.0, color: Colors.grey[700]),
                ),
              ),
            ),
            Divider(),
            SizedBox(
              height: 30,
              width: MediaQuery.of(context).size.width,
              child: FlatButton(
                color: Colors.white,
                textColor: Colors.grey,
                padding: EdgeInsets.all(2.0),
                onPressed: () {},
                child: Text(
                  "Terms & Conditions",
                  style: TextStyle(fontSize: 15.0, color: Colors.grey[700]),
                ),
              ),
            ),
            Divider(),
            SizedBox(
              height: 30,
              width: MediaQuery.of(context).size.width,
              child: FlatButton(
                color: Colors.white,
                textColor: Colors.grey,
                padding: EdgeInsets.all(2.0),
                onPressed: () {
                  // Navigator.pushReplacement(context,
                  //     MaterialPageRoute(builder: (context) => FeedbackPage()));
                },
                child: Text(
                  "Leave Feedback",
                  style: TextStyle(fontSize: 15.0, color: Colors.grey[700]),
                ),
              ),
            ),
            Divider(),
            Padding(
              padding: EdgeInsets.only(
                top: 0.4 * MediaQuery.of(context).size.height,
                left: 0.05 * MediaQuery.of(context).size.width,
                right: 0.05 * MediaQuery.of(context).size.width,
              ),
              child: SizedBox(
                height: 45,
                width: double.infinity,
                child: RaisedButton(
                  color: Colors.amber,
                  // textColor: Colors.grey,
                  padding: EdgeInsets.all(2.0),
                  onPressed: () {
                    // signOutGoogle();
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => Login()));
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => Home(),
                    //   ),
                    // );
                  },
                  child: Text(
                    "LOG OUT",
                    style: TextStyle(fontSize: 23.0, color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
