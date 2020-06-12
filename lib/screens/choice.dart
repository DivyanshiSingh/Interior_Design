import 'package:flutter/material.dart';
import 'package:interiordesign/Designer/freelancerlogin.dart';
// import 'package:interiordesign/screens/freelancerlogin.dart';
import 'package:interiordesign/screens/signup.dart';
import '../screens/login.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // debugShowCheckedModeBanner: false,
      home: Scaffold(
        // appBar: AppBar(title: const Text(_title)),
        body: Center(
          child: Choice(),
        ),
      ),
    );
  }
}

class Choice extends StatefulWidget {
  @override
  _ChoiceState createState() => _ChoiceState();
}

class _ChoiceState extends State<Choice> {
  String dropdownValue;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      color: Colors.white,
      child: Stack(
        children: <Widget>[
          Positioned(
            left: 200,
            bottom: 500,
            child: CircleAvatar(
              backgroundColor: Colors.yellow,
              radius: 130,
              child: CircleAvatar(
                backgroundColor: Colors.amber[400],
                radius: 100,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(30, 190, 10, 0),
            child: Text(
              "Help us improve your",
              style: TextStyle(
                fontWeight: FontWeight.w900,
                // fontStyle: FontStyle.italic,
                fontFamily: 'Open Sans',
                decoration: TextDecoration.none,
                fontSize: 37,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(95, 235, 10, 0),
            child: Text(
              "experience!",
              style: TextStyle(
                fontWeight: FontWeight.w900,
                // fontStyle: FontStyle.italic,
                fontFamily: 'Open Sans',
                decoration: TextDecoration.none,
                fontSize: 37,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(80, 280, 10, 0),
            child: Text(
              "What are you looking for?",
              style: TextStyle(
                // fontWeight: FontWeight.w900,
                // fontStyle: FontStyle.italic,
                fontFamily: 'Open Sans',
                decoration: TextDecoration.none,
                fontSize: 20,
                color: Colors.black38,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            // padding: const EdgeInsets.all(100),
            padding: const EdgeInsets.fromLTRB(120, 330, 0, 0),
            child: Container(
              height: 60,
              // width: 300,
              color: Colors.deepOrange[100],
              child: Material(
                child: DropdownButton<String>(
                  hint: Text(
                    'select an option',
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                  value: dropdownValue,
                  icon: Icon(
                    Icons.arrow_drop_down,
                    color: Colors.black,
                  ),
                  iconSize: 24,
                  elevation: 16,
                  style: TextStyle(color: Colors.grey),
                  // underline: Container(
                  //   height: 40.0,
                  //   // width: 100.0,
                  //   color: Colors.deepOrange[100],
                  // ),
                  // SizedBox(
                  //   width: 42.0,
                  //   height: 42.0,
                  //   child: const DecoratedBox(
                  //     decoration: const BoxDecoration(color: Colors.deepOrange),
                  //   ),
                  // ),
                  onChanged: (String newValue) {
                    setState(() {
                      dropdownValue = newValue;
                    });
                  },
                  items: <String>['I am a buyer', 'I am a designer']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: TextStyle(fontSize: 20, color: Colors.black),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
          ),
          if (dropdownValue == "I am a designer") ...[
            Padding(
              padding: const EdgeInsets.fromLTRB(25, 400, 0, 0),
              child: Text(
                "Discover our world of interior designer available to hire per project, send messages and control your finance.",
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black38,
                  fontFamily: 'Open Sans',
                  decoration: TextDecoration.none,
                ),
              ),
            ),
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
                        builder: (context) => Signup(),
                      ),
                    );
                  },
                  child: Text(
                    "SIGN UP",
                    style: TextStyle(fontSize: 20.0),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(100, 650, 20, 10),
              child: Text(
                "Already have an account?",
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.black38,
                  fontFamily: 'Open Sans',
                  decoration: TextDecoration.none,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(225, 650, 20, 10),
              child: Material(
                child: InkWell(
                  child: Text(
                    "Login",
                    style: TextStyle(
                        fontSize: 12,
                        color: Colors.amber,
                        fontFamily: 'Open Sans',
                        decoration: TextDecoration.none,
                        fontWeight: FontWeight.bold),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => FreelancerLogin(),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
          if (dropdownValue == "I am a buyer") ...[
            Padding(
              padding: const EdgeInsets.fromLTRB(25, 400, 0, 0),
              child: Text(
                "Discover our world of interior designer available to hire per project, send messages and control your finance.",
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black38,
                  fontFamily: 'Open Sans',
                  decoration: TextDecoration.none,
                ),
              ),
            ),
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
                        builder: (context) => Signup(),
                      ),
                    );
                  },
                  child: Text(
                    "SIGN UP",
                    style: TextStyle(fontSize: 20.0),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(100, 650, 20, 10),
              child: Text(
                "Already have an account?",
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.black38,
                  fontFamily: 'Open Sans',
                  decoration: TextDecoration.none,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(225, 650, 20, 10),
              child: Material(
                child: InkWell(
                  child: Text(
                    "Login",
                    style: TextStyle(
                        fontSize: 12,
                        color: Colors.amber,
                        fontFamily: 'Open Sans',
                        decoration: TextDecoration.none,
                        fontWeight: FontWeight.bold),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Login(),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
