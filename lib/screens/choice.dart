import 'package:flutter/material.dart';
import 'package:interiordesign/Designer/freelancerlogin.dart';
// import 'package:interiordesign/screens/freelancerlogin.dart';
import 'package:interiordesign/screens/signup.dart';
import '../screens/login.dart';
import '../size_config.dart';

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
    SizeConfig().init(context);
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
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
          Container(
            margin: EdgeInsets.symmetric(vertical: 160.0, horizontal: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Column(children: <Widget>[
                  SizedBox(
                    height: 30,
                  ),
                  Center(
                    child: FittedBox(
                      child: Text(
                        'Help us improve your',
                        style: TextStyle(
                          fontWeight: FontWeight.w900,
                          // fontStyle: FontStyle.italic,
                          fontFamily: 'Open Sans',
                          decoration: TextDecoration.none,
                          fontSize: 30,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: FittedBox(
                      child: Text(
                        "Experience!",
                        style: TextStyle(
                          fontWeight: FontWeight.w900,
                          // fontStyle: FontStyle.italic,
                          fontFamily: 'Open Sans',
                          decoration: TextDecoration.none,
                          fontSize: 30,
                          color: Colors.black,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Center(
                      child: FittedBox(
                    child: Text(
                      "What are you looking for?",
                      style: TextStyle(
                        fontFamily: 'Open Sans',
                        decoration: TextDecoration.none,
                        fontSize: 20,
                        color: Colors.black38,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ))
                ]),
              ],
            ),
          ),
          Positioned(
            top: 100,
            left: 100,
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 250),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Material(
                        child: DropdownButton<String>(
                          hint: Text(
                            'select an option',
                          ),
                          value: dropdownValue,
                          icon: Icon(
                            Icons.arrow_drop_down,
                            color: Colors.black,
                          ),
                          iconSize: 24,
                          elevation: 16,
                          onChanged: (String newValue) {
                            setState(() {
                              dropdownValue = newValue;
                            });
                          },
                          items: <String>['I am a buyer', 'I am a designer']
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Row(
                                children: <Widget>[
                                  Icon(
                                    Icons.grade,
                                    color: Colors.lightGreen,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    value,
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ],
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          if (dropdownValue == "I am a designer") ...[
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 400, 20, 0),
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
            SizedBox(height: 30),
            // Spacer(),
            // Padding(
            //   padding: EdgeInsets.symmetric(
            Positioned(
              left: 0.07 * MediaQuery.of(context).size.width,
              right: 0.07 * MediaQuery.of(context).size.width,
              top: 6 * MediaQuery.of(context).size.height / 7,
              // padding: const EdgeInsets.fromLTRB(20, 585, 20, 50),
              child: SizedBox(
                width: 0.9 * MediaQuery.of(context).size.width,
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
            Row(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(
                    top: 0.95 * MediaQuery.of(context).size.height,
                    left: 0.25 * MediaQuery.of(context).size.width,
                    // right: 0.25 * MediaQuery.of(context).size.width,
                  ),
                  //       horizontal: MediaQuery.of(context).size.width / 7,
                  //       vertical: MediaQuery.of(context).size.height / 3),
                  // padding: const EdgeInsets.fromLTRB(100, 650, 20, 10),
                  // child:

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
                // ),
                Padding(
                  padding: EdgeInsets.only(
                    top: 0.95 * MediaQuery.of(context).size.height,
                    // left: 0.10 * MediaQuery.of(context).size.width,
                  ),
                  //       horizontal: MediaQuery.of(context).size.width / 500,
                  //       vertical: MediaQuery.of(context).size.height / 5),
                  // padding: const EdgeInsets.fromLTRB(225, 650, 20, 10),
                  // child:

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
            ),
          ],
          if (dropdownValue == "I am a buyer") ...[
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 400, 20, 0),
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
            SizedBox(height: 30),
            // Spacer(),
            // Padding(
            //   padding: EdgeInsets.symmetric(
            Positioned(
              left: 0.07 * MediaQuery.of(context).size.width,
              right: 0.07 * MediaQuery.of(context).size.width,
              top: 6 * MediaQuery.of(context).size.height / 7,
              // padding: const EdgeInsets.fromLTRB(20, 585, 20, 50),
              child: SizedBox(
                width: 0.9 * MediaQuery.of(context).size.width,
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
            Row(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(
                    top: 0.95 * MediaQuery.of(context).size.height,
                    left: 0.25 * MediaQuery.of(context).size.width,
                    // right: 0.25 * MediaQuery.of(context).size.width,
                  ),
                  //       horizontal: MediaQuery.of(context).size.width / 7,
                  //       vertical: MediaQuery.of(context).size.height / 3),
                  // padding: const EdgeInsets.fromLTRB(100, 650, 20, 10),
                  // child:

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
                // ),
                Padding(
                  padding: EdgeInsets.only(
                    top: 0.95 * MediaQuery.of(context).size.height,
                    // left: 0.10 * MediaQuery.of(context).size.width,
                  ),
                  //       horizontal: MediaQuery.of(context).size.width / 500,
                  //       vertical: MediaQuery.of(context).size.height / 5),
                  // padding: const EdgeInsets.fromLTRB(225, 650, 20, 10),
                  // child:

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
            ),
          ],
        ],
      ),
    );
  }

  // sizedBox() {}
}
