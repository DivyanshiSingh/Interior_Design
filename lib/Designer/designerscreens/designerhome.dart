import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:interiordesign/Designer/designerbottomNavigation_screens/dpagefive.dart';
import 'package:interiordesign/Designer/designerbottomNavigation_screens/dpagefour.dart';
import 'package:interiordesign/Designer/designerbottomNavigation_screens/dpageone.dart';
import 'package:interiordesign/Designer/designerbottomNavigation_screens/dpagethree.dart';
import 'package:interiordesign/Designer/designerbottomNavigation_screens/dpagetwo.dart';
import 'package:interiordesign/Designer/designerservices/dprofile.dart';
import 'package:interiordesign/Designer/freelancerlogin.dart';
import 'package:interiordesign/authentication/auth.dart';

class DesignerHome extends StatefulWidget {
  // final FirebaseUser user;

  // const Home({Key key, @required this.user}) : super(key: key);
  @override
  _DesignerHomeState createState() => _DesignerHomeState();
}

class _DesignerHomeState extends State<DesignerHome> {
  int _currentIndex = 0;
  Icon cusIcon = Icon(Icons.search);
  Widget cusSearchBar = Text('InsideOut');
  Widget callPage(int currentIndex) {
    switch (currentIndex) {
      case 0:
        return DPageone();
      case 1:
        return DPagetwo();
      case 2:
        return DPagethree();
      case 3:
        return DPagefour();
      case 4:
        return DPagefive();
        break;
      default:
        return DPageone();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        elevation: 0.1,
        backgroundColor: Colors.amber,
        title: Text(
          'InsideOut ',
          // ${widget.user.email}
        ),
        actions: <Widget>[
          new IconButton(
            icon: cusIcon,
            onPressed: () {
              setState(() {
                if (this.cusIcon.icon == Icons.search) {
                  this.cusIcon = Icon(Icons.search);
                  this.cusSearchBar = TextField(
                    textInputAction: TextInputAction.go,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                    ),
                  );
                } else {
                  this.cusIcon = Icon(Icons.search);
                  this.cusSearchBar = Text('InsideOut');
                }
              });
            },
          ),
          new IconButton(
            icon: Icon(
              Icons.notifications,
            ),
            onPressed: () {},
          ),
          new IconButton(
            icon: Icon(
              Icons.account_circle,
            ),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => DProfile()));
            },
          )
        ],
      ),
      drawer: new Drawer(
        child: new ListView(
          children: <Widget>[
            new UserAccountsDrawerHeader(
              // accountName: Text('$userName'),
              // accountEmail: Text('$email'),
              currentAccountPicture: GestureDetector(
                child: new CircleAvatar(
                    // backgroundImage: NetworkImage('$photoUrl'),
                    ),
              ),
              decoration: new BoxDecoration(color: Colors.amber),
            ),
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => DesignerHome()));
              },
              child: ListTile(
                title: Text('Home Page'),
                leading: Icon(Icons.home, color: Colors.amber),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => DProfile()));
              },
              child: ListTile(
                title: Text('My accounts'),
                leading: Icon(Icons.person, color: Colors.amber),
              ),
            ),
            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text('My deals'),
                leading: Icon(Icons.business, color: Colors.amber),
              ),
            ),
            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text('My Customers'),
                leading: Icon(Icons.people, color: Colors.amber),
              ),
            ),
            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text('Favourites'),
                leading: Icon(Icons.favorite, color: Colors.amber),
              ),
            ),
            Divider(),
            InkWell(
              onTap: () {
                signOutGoogle();
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => FreelancerLogin()));
              },
              child: ListTile(
                title: Text('Logout'),
                leading: Icon(
                  Icons.settings,
                  color: Colors.black,
                ),
              ),
            ),
            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text('About'),
                leading: Icon(Icons.help, color: Colors.black),
              ),
            ),
          ],
        ),
      ),
      body: callPage(_currentIndex),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        backgroundColor: Colors.amber[50],
        type: BottomNavigationBarType.fixed,
        onTap: (value) {
          setState(() {
            _currentIndex = value;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.explore),
            title: Text('explore'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.folder),
            title: Text('Projects'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message),
            title: Text('Messages'),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.attach_money,
            ),
            title: Text('Finances'),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.favorite,
            ),
            title: Text('saved'),
          ),
        ],
      ),
    );
  }
}
