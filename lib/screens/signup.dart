import 'package:flutter/material.dart';
import 'package:interiordesign/screens/hello.dart';

class Signup extends StatefulWidget {
  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _nameTextController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();
  bool hidden = true;
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
            padding: EdgeInsets.fromLTRB(40, 120, 10, 0),
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
            padding: EdgeInsets.fromLTRB(40, 160, 10, 0),
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
            padding: const EdgeInsets.fromLTRB(10, 200, 14, 8),
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
            padding: EdgeInsets.fromLTRB(40, 260, 30, 0),
            child: Material(
              color: Colors.white,
              child: TextFormField(
                controller: _emailTextController,
                decoration: InputDecoration(
                  hintText: "email",
                  icon: Icon(Icons.email),
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    Pattern pattern =
                        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                    RegExp regex = new RegExp(pattern);
                    if (!regex.hasMatch(value))
                      return 'Please make sure your email address is valid';
                    else
                      return null;
                  }
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(28, 320, 30, 0),
            child: Material(
              color: Colors.white,
              // borderRadius: BorderRadius.circular(20),
              // color: Colors.white.withOpacity(0.8),
              elevation: 0.0,
              child: Padding(
                padding: const EdgeInsets.only(left: 12),
                child: TextFormField(
                  controller: _passwordTextController,
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
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(14, 380, 2, 8),
            child: Material(
              // borderRadius: BorderRadius.circular(20),
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
                      // border: InputBorder.none,
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return "The password field cannot be empty";
                      } else if (value.length < 6) {
                        return "the password has to be at least 6 characters";
                      } else if (_passwordTextController.text != value) {
                        return "the password don't match";
                      }
                      return null;
                    },
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
            padding: const EdgeInsets.fromLTRB(85, 480, 30, 0),
            child: Material(
              borderRadius: BorderRadius.circular(20),
              color: Colors.amber,
              elevation: 0.0,
              child: MaterialButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Hello(),
                    ),
                  );
                },
                minWidth: 200,
                // MediaQuery.of(context).size.width,
                child: Text(
                  "SignUp",
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
          Padding(
            padding: const EdgeInsets.fromLTRB(95, 650, 20, 0),
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
        ],
      ),
    );
  }
}
