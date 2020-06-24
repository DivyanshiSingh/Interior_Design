import 'package:flutter/material.dart';
import 'package:interiordesign/Designer/designerservices/designerApplication/dstartSelling.dart';

import 'package:interiordesign/Designer/freelancerlogin.dart';
import 'package:interiordesign/screens/login.dart';
import 'package:interiordesign/services/feedback.dart';

class DSettings extends StatefulWidget {
  @override
  _DSettingsState createState() => _DSettingsState();
}

class _DSettingsState extends State<DSettings> {
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
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DStartSelling(),
                    ),
                  );
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
                // child: Padding(
                //   padding: EdgeInsets.fromLTRB(0, 0, 280, 0),
                child: Text(
                  "Help",
                  style: TextStyle(fontSize: 15.0, color: Colors.grey[700]),
                ),
              ),
            ),
            // ),
            Divider(),
            SizedBox(
              height: 30,
              width: double.infinity,
              child: FlatButton(
                color: Colors.white,
                textColor: Colors.grey,
                padding: EdgeInsets.all(2.0),
                onPressed: () {},
                // child: Padding(
                //   padding: EdgeInsets.fromLTRB(0, 0, 170, 0),
                child: Text(
                  "Terms & Conditions",
                  style: TextStyle(fontSize: 15.0, color: Colors.grey[700]),
                ),
              ),
            ),
            // ),
            Divider(),
            SizedBox(
              height: 30,
              width: double.infinity,
              child: FlatButton(
                color: Colors.white,
                textColor: Colors.grey,
                padding: EdgeInsets.all(2.0),
                onPressed: () {
                  // Navigator.pushReplacement(context,
                  //     MaterialPageRoute(builder: (context) => FeedbackPage()));
                },
                // child: Padding(
                //   padding: EdgeInsets.fromLTRB(0, 0, 190, 0),
                child: Text(
                  "Leave Feedback",
                  style: TextStyle(fontSize: 15.0, color: Colors.grey[700]),
                ),
              ),
            ),
            // ),
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
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => FreelancerLogin()));
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
