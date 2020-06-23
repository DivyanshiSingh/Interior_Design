import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';

import 'dart:async';

import '../screens/home.dart';
import 'freelancerlogin.dart';

class FreelancerSignup extends StatefulWidget {
  @override
  _FreelancerSignupState createState() => _FreelancerSignupState();
}

class _FreelancerSignupState extends State<FreelancerSignup> {
  String _email, _password, _username;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController _nameTextController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();

  bool hidden = true;

  void saveName() {
    String name = _nameTextController.text;

    saveNamePreferencies(name).then((bool committed) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Hello(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
            SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 130, 10, 0),
                      child: Text(
                        "SignUp",
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
                      padding: EdgeInsets.fromLTRB(20, 20, 10, 0),
                      child: Text(
                        "Please signin to continue",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          // fontStyle: FontStyle.italic,
                          fontFamily: 'Open Sans',
                          decoration: TextDecoration.none,
                          fontSize: 18,
                          color: Colors.grey,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 30, 14, 8),
                      child: Material(
                        color: Colors.white,
                        // borderRadius: BorderRadius.circular(20),
                        // color: Colors.grey.withOpacity(0.2),
                        elevation: 0.0,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 12),
                          child: ListTile(
                            title: TextFormField(
                              controller: _nameTextController,
                              decoration: InputDecoration(
                                hintText: "User Name",
                                icon: Icon(Icons.person, size: 28),
                                // border: InputBorder.none,
                              ),
                              onSaved: (value) => _username = value,
                              validator: (value) {
                                if (value.isEmpty) {
                                  return "The name field cannot be empty";
                                }
                                return null;
                              },
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(40, 10, 30, 0),
                      child: Material(
                        child: TextFormField(
                          decoration: InputDecoration(
                            hintText: "email",
                            icon: Icon(Icons.email),
                          ),
                          validator: (value) {
                            if (value.isEmpty) {
                              // Pattern pattern =
                              //     r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                              // RegExp regex = new RegExp(pattern);
                              // if (!regex.hasMatch(value))
                              //   return 'Please make sure your email address is valid';
                              // else
                              return 'Please type an email';
                            } else {
                              return null;
                            }
                            // return null;
                          },
                          onSaved: (value) => _email = value,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(28, 30, 30, 0),
                      child: Material(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white.withOpacity(0.8),
                        elevation: 0.0,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 12),
                          child: TextFormField(
                            obscureText: hidden,
                            decoration: InputDecoration(
                              hintText: "password",
                              icon: Icon(
                                Icons.lock,
                                size: 28,
                              ),
                            ),
                            validator: (value) {
                              if (value.isEmpty) {
                                return "The password field cannot be empty";
                              } else if (value.length < 6) {
                                return "the password has to be at least 6 characters";
                              }
                              return null;
                            },
                            onSaved: (value) => _password = value,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(14, 20, 2, 8),
                      child: Material(
                        color: Colors.white,
                        elevation: 0.0,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 12),
                          child: ListTile(
                            title: TextFormField(
                              controller: _confirmPasswordController,
                              obscureText: hidden,
                              decoration: InputDecoration(
                                hintText: "Confirm Password",
                                icon: Icon(Icons.lock, size: 28),
                              ),
                              // onSaved: (value) => _password = value,
                              // validator: (value) {
                              //   if (value.isEmpty) {
                              //     return "The password field cannot be empty";
                              //   } else if (value.length < 6) {
                              //     return "the password has to be at least 6 characters";
                              //   } else if (_password != value) {
                              //     return "the password don't match";
                              //   }
                              //   return null;
                              // },
                            ),
                            trailing: IconButton(
                              icon: Icon(Icons.remove_red_eye),
                              onPressed: () {
                                setState(() {
                                  hidden = false;
                                });
                              },
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: 0.03 * MediaQuery.of(context).size.height),
                      child: Material(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.amber,
                        elevation: 0.0,
                        child: MaterialButton(
                          onPressed: () {
                            signUp();
                          },
                          minWidth: 200,
                          // MediaQuery.of(context).size.width,
                          child: Text(
                            "Sign Up",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: 0.96 * MediaQuery.of(context).size.height,
              ),
              child: Center(
                child: Text(
                  "InsideOut presents you artified walls",
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.black38,
                    fontFamily: 'Open Sans',
                    decoration: TextDecoration.none,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> signUp() async {
    if (_formKey.currentState.validate()) {
      // final formState = _formKey.currentState;
      // if (formState.validate()) {
      //   formState.save();
      _formKey.currentState.save();
      try {
        AuthResult user =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _email,
          password: _password,
        );
        // user.sendEmailVerifcation();
        Navigator.of(context).pop();
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => FreelancerLogin()));
        // Navigator.push(
        //     context, MaterialPageRoute(builder: (context) => Home()));
      } catch (e) {
        print(e);
      }
    }
  }
}

Future<bool> saveNamePreferencies(String name) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString("name", name);
  return prefs.commit();
}

Future<String> getNamePreferencies() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String name = prefs.getString("name");
  return name;
}

//  ==== HELLO SCREEN ====
class Hello extends StatefulWidget {
  @override
  _HelloState createState() => _HelloState();
}

class _HelloState extends State<Hello> {
  String _name = " ";

  @override
  void initState() {
    getNamePreferencies().then(updateName);
    super.initState();
  }

  void updateName(String name) {
    setState(() {
      this._name = name;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      color: Colors.white,
      child: Stack(children: <Widget>[
        Padding(
          padding: const EdgeInsets.fromLTRB(110, 100, 0, 0),
          child: Container(
            height: 150,
            width: 150,
            // decoration: BoxDecoration(borderRadius: BorderRadius.circular(100)),
            color: Colors.white,
            //when we pass any image in stateful widget
            child: Image.asset('lib/images/hi.jpg'),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(165, 270, 20, 0),
          child: Text(
            "Hi",
            style: TextStyle(
              fontSize: 30,
              color: Colors.amber,
              fontFamily: 'Open Sans',
              decoration: TextDecoration.none,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(160, 320, 20, 0),
          child: Text(
            _name,
            style: TextStyle(
              fontSize: 30,
              color: Colors.amber,
              fontFamily: 'Open Sans',
              decoration: TextDecoration.none,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(35, 370, 20, 0),
          child: Text(
            "glad to have you on board!",
            style: TextStyle(
              fontSize: 28,
              color: Colors.amber,
              fontFamily: 'Open Sans',
              decoration: TextDecoration.none,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(45, 410, 10, 0),
          child: Text(
            "your account has been created successfully",
            style: TextStyle(
              fontSize: 16,
              color: Colors.amber,
              fontWeight: FontWeight.w400,
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
                    builder: (context) => Home(),
                  ),
                );
              },
              child: Text(
                "LETS GET STARTED",
                style: TextStyle(fontSize: 20.0, color: Colors.white),
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
