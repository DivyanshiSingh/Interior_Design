import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:interiordesign/Designer/designerscreens/designerhome.dart';
import 'package:interiordesign/screens/home.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../authentication/auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';

class FreelancerLogin extends StatefulWidget {
  @override
  _FreelancerLoginState createState() => _FreelancerLoginState();
}

class _FreelancerLoginState extends State<FreelancerLogin> {
  String _email, _password;
  GoogleSignIn googleAuth = new GoogleSignIn();
  FacebookLogin fbLogin = new FacebookLogin();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  // TextEditingController _emailTextController = TextEditingController();
  // TextEditingController _passwordTextController = TextEditingController();

  bool hidden = true;

  SharedPreferences preferences;
  bool loading = false;
  bool isLoggedin = false;
  @override
  void initState() {
    super.initState();
    isSignedIn();
  }

  void isSignedIn() async {
    setState(() {
      loading = true;
    });
    preferences = await SharedPreferences.getInstance();
    // isLoggedin = await googleSignIn.isSignedIn();
    isLoggedin = await isUser();
    // FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    // await firebaseAuth.currentUser().then((user) async {

    //   if (user != null) {
    //       var token = await user.getIdToken();
    //     if(token == null){
    //       setState(() => {
    //         isLoggedin = false
    //       });
    //     }
    //     setState(() => isLoggedin = true);
    //   }
    // });
    print('Here');
    if (isLoggedin) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => DesignerHome()));
    }
    setState(() {
      loading = false;
    });
  }

  Future<FirebaseUser> handleSignIn() async {
    preferences = await SharedPreferences.getInstance();
    setState(() {
      loading = true;
    });

    FirebaseUser firebaseUser = await signInWithGoogle();
    print(firebaseUser.email);
    if (firebaseUser != null) {
      // final QuerySnapshot result = await Firestore.instance
      //     .collection("users")
      //     .where("id", isEqualTo: firebaseUser.uid)
      //     .getDocuments();
      // print(result.documents[0]);
      // final List<DocumentSnapshot> documents = result.documents;
      // if (documents.length == 0) {
      //   // insert the user to our collections.

      //   Firestore.instance
      //       .collection("users")
      //       .document(firebaseUser.uid)
      //       .setData({
      //     "id": firebaseUser.uid,
      //     "username": firebaseUser.displayName,
      //     "profilePicture": firebaseUser.photoUrl,
      //     "email": firebaseUser.email,
      //   });

      await preferences.setString("id", firebaseUser.uid);
      await preferences.setString("username", firebaseUser.displayName);
      await preferences.setString("photoUrl", firebaseUser.photoUrl);
      await preferences.setString("email", firebaseUser.email);

      Fluttertoast.showToast(msg: "Login was successful");

      setState(() {
        loading = false;
      });
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Home()));
    } else {
      Fluttertoast.showToast(msg: "Login failed :(");
    }
    isSignedIn();
    return firebaseUser;
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
            Padding(
              padding: EdgeInsets.fromLTRB(40, 160, 10, 0),
              child: Text(
                "Hello Designer",
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
            SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.fromLTRB(40, 260, 30, 0),
                      child: Material(
                        child: TextFormField(
                          // controller: _emailTextController,
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
                            // controller: _passwordTextController,
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
                      padding: const EdgeInsets.fromLTRB(30, 30, 30, 0),
                      child: Material(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.amber,
                        elevation: 0.0,
                        child: MaterialButton(
                          onPressed: () {
                            signIn();
                          },
                          minWidth: double.infinity,
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
                      padding: const EdgeInsets.fromLTRB(30, 30, 30, 0),
                      child: Material(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.amber,
                        elevation: 0.0,
                        child: MaterialButton(
                          onPressed:

                              //  ====== by market at home ========
                              () => handleSignIn()
                                  .then((FirebaseUser user) =>
                                      print(user.displayName))
                                  .catchError((e) => print(e)),

                          minWidth: double.infinity,
                          // MediaQuery.of(context).size.width,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.fromLTRB(0.0, 8, 27, 8),
                                decoration: BoxDecoration(
                                  color: Colors.amber,
                                ),
                                child: Image.asset(
                                  'lib/images/google.png',
                                  height: 33.0,
                                ),
                              ),
                              Container(
                                padding:
                                    EdgeInsets.only(left: 0.0, right: 10.0),
                                child: Text(
                                  "Login with Google",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 25,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(30, 30, 30, 0),
                      child: Material(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.amber,
                        elevation: 0.0,
                        child: MaterialButton(
                          onPressed: () {
                            //  fbLogin.logInWithReadPermissions(['email','public_profile']).then((result){
                            //    switch(result.status){
                            //      case FacebookLoginStatus.loggedIn;
                            //      FirebaseAuth.instance.signInWithFacebook(
                            //        accessToken: result.accessToken.token
                            //      ).then((signedInUser){
                            //        print('Signed in as ${ signedInUser.displayName} ');
                            //        Navigator.of(context).pushReplacement('/Home');
                            //      }).catchError((e){
                            //        print(e);
                            //      },);}

                            //  }).catchError((e){
                            //    print(e);

                            //  });
                          },
                          minWidth: double.infinity,
                          // MediaQuery.of(context).size.width,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.all(8.0),
                                decoration: BoxDecoration(
                                  color: Colors.amber,
                                ),
                                child: Image.asset(
                                  'lib/images/facebook.png',
                                  height: 33.0,
                                ),
                              ),
                              Container(
                                padding:
                                    EdgeInsets.only(left: 10.0, right: 10.0),
                                child: Text(
                                  "Login with facebook",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 25,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
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
                        builder: (context) => FreelancerLogin(),
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
      ),
    );
  }

  Future<void> signIn() async {
    final formState = _formKey.currentState;
    if (formState.validate()) {
      formState.save();
      try {
        AuthResult user = await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: _email, password: _password);
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => DesignerHome()));
      } catch (e) {
        print(e);
      }
    }
  }
}
