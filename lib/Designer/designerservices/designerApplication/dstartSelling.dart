import 'package:flutter/material.dart';
import 'package:interiordesign/Designer/designerservices/designerApplication/editProfile.dart';
// import 'package:interiordesign/Designer/designerservices/designerSelling/editProfile.dart';
// import 'package:interiordesign/Designer/designerservices/designerSelling/example.dart';

class DStartSelling extends StatefulWidget {
  @override
  _DStartSellingState createState() => _DStartSellingState();
}

class _DStartSellingState extends State<DStartSelling> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        elevation: 0.1,
        backgroundColor: Colors.amber,
        title: Text(
          'Designer Application',
        ),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(
                  left: 0.07 * MediaQuery.of(context).size.width,
                  // right: 0.08 * MediaQuery.of(context).size.width
                ),
                child: Text(
                  "You're almost ready to start selling",
                  style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 27,
                      fontWeight: FontWeight.bold),
                ),
              ),

              // Padding(
              //   padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
              //   child: Text(
              //     "selling!",
              //     style: TextStyle(
              //         color: Colors.grey[600],
              //         fontSize: 30,
              //         fontWeight: FontWeight.bold),
              //   ),
              // ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 15, 10, 0),
                child: Text(
                  "Please complete your application in order to join our community of the highest quality Designers online. A solid application proves to us that you're serious about selling and gives our customers confidence that you're a great fit for their needs",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 15,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                child: Text(
                  "APPLY IN 5 STEPS",
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                child: Container(
                  height: 120,
                  width: double.infinity,
                  color: Colors.amber[100],
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: CircleAvatar(
                          radius: 28,
                          backgroundColor: Colors.white,
                          child: IconButton(
                            icon: Icon(
                              Icons.person,
                            ),
                            onPressed: () {},
                          ),
                        ),
                      ),
                      Text(
                        "Tell Us About You",
                        style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                child: Container(
                  height: 120,
                  width: double.infinity,
                  color: Colors.amber[100],
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: CircleAvatar(
                          radius: 28,
                          backgroundColor: Colors.white,
                          child: IconButton(
                            icon: Icon(
                              Icons.mode_edit,
                            ),
                            onPressed: () {},
                          ),
                        ),
                      ),
                      Text(
                        "Select Your Skills",
                        style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                child: Container(
                  height: 120,
                  width: double.infinity,
                  color: Colors.amber[100],
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: CircleAvatar(
                          radius: 28,
                          backgroundColor: Colors.white,
                          child: IconButton(
                            icon: Icon(
                              Icons.format_quote,
                            ),
                            onPressed: () {},
                          ),
                        ),
                      ),
                      Text(
                        "Add References",
                        style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                child: Container(
                  height: 120,
                  width: double.infinity,
                  color: Colors.amber[100],
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: CircleAvatar(
                          radius: 28,
                          backgroundColor: Colors.white,
                          child: IconButton(
                            icon: Icon(
                              Icons.laptop_mac,
                            ),
                            onPressed: () {},
                          ),
                        ),
                      ),
                      Text(
                        "Set Your On-site Preferences",
                        style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                child: Container(
                  height: 120,
                  width: double.infinity,
                  color: Colors.amber[100],
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: CircleAvatar(
                          radius: 28,
                          backgroundColor: Colors.white,
                          child: IconButton(
                            icon: Icon(
                              Icons.star_half,
                            ),
                            onPressed: () {},
                          ),
                        ),
                      ),
                      Text(
                        "Personalize Your Application",
                        style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                child: Container(
                  height: 50.0,
                  width: 200,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          // builder: (context) => EditProfile(),
                          builder: (context) => EditProfile(),
                        ),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.amber,
                          style: BorderStyle.solid,
                          width: 2.0,
                        ),
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Center(
                            child: Text(
                              "APPLY NOW",
                              style: TextStyle(
                                color: Colors.amber,
                                fontFamily: 'Montserrat',
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 1,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                child: Text(
                  "Will take less than 3 minutes!",
                  style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 13,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
