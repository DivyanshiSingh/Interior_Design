import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _passwordTextController = TextEditingController();

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
            padding: EdgeInsets.fromLTRB(40, 160, 10, 0),
            child: Text(
              "Login",
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
            padding: EdgeInsets.fromLTRB(40, 210, 10, 0),
            child: Text(
              "Please login to continue",
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
            padding: EdgeInsets.fromLTRB(40, 260, 30, 0),
            child: Material(
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
            padding: const EdgeInsets.fromLTRB(28, 340, 30, 0),
            child: Material(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white.withOpacity(0.8),
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
            padding: const EdgeInsets.fromLTRB(170, 440, 30, 0),
            child: Material(
              borderRadius: BorderRadius.circular(20),
              color: Colors.amber,
              elevation: 0.0,
              child: MaterialButton(
                onPressed: () {},
                minWidth: 200,
                // MediaQuery.of(context).size.width,
                child: Text(
                  "Login",
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
            padding: const EdgeInsets.fromLTRB(80, 650, 20, 0),
            child: Material(
              child: InkWell(
                child: Text(
                  "Forgot password ?",
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
          Padding(
            padding: const EdgeInsets.fromLTRB(170, 650, 20, 0),
            child: Text(
              "Don't worry, click here.",
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
