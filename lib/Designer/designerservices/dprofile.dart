import 'package:flutter/material.dart';
import 'package:interiordesign/Designer/designerservices/dsettings.dart';

class DProfile extends StatefulWidget {
  @override
  _DProfileState createState() => new _DProfileState();
}

class _DProfileState extends State<DProfile> {
  Icon cusIcon = Icon(Icons.search);
  Widget cusSearchBar = Text('InsideOut');
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          elevation: 0.1,
          backgroundColor: Colors.amber,
          title: Text(
            'Profile ',
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
                Icons.settings,
              ),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => DSettings()));
              },
            ),
          ],
        ),
        body: new Stack(
          children: <Widget>[
            ClipPath(
              child: Container(color: Colors.amber[100].withOpacity(0.8)),
              clipper: getClipper(),
            ),
            Positioned(
                width: 350.0,
                top: MediaQuery.of(context).size.height / 8,
                child: Column(
                  children: <Widget>[
                    Container(
                      width: 120.0,
                      height: 120.0,
                      decoration: BoxDecoration(
                        color: Colors.amber,
                        // image: DecorationImage(
                        //     image: NetworkImage(
                        //         'https://pixel.nymag.com/imgs/daily/vulture/2017/06/14/14-tom-cruise.w700.h700.jpg'),
                        //     fit: BoxFit.cover),
                        borderRadius: BorderRadius.all(Radius.circular(75.0)),
                      ),
                    ),
                    SizedBox(height: 20.0),
                    Text(
                      'Amica',
                      style: TextStyle(
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Montserrat'),
                    ),
                    SizedBox(height: 10.0),
                    Text(
                      'Crawley,GB',
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 17.0,
                          // fontStyle: FontStyle.italic,
                          fontFamily: 'Montserrat'),
                    ),
                    SizedBox(height: 20.0),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 230, 0),
                      child: Text(
                        'Insights',
                        style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 23.0,
                            fontWeight: FontWeight.bold,
                            // fontStyle: FontStyle.italic,
                            fontFamily: 'Montserrat'),
                      ),
                    ),
                    SizedBox(height: 15.0),
                    Divider(),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 190, 0),
                      child: Text(
                        'Projects completed',
                        style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 15.0,
                            // fontWeight: FontWeight.bold,
                            // fontStyle: FontStyle.italic,
                            fontFamily: 'Montserrat'),
                      ),
                    ),
                    Divider(),
                    // SizedBox(height: 20.0),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 170, 0),
                      child: Text(
                        'Projects completed (%)',
                        style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 15.0,
                            // fontWeight: FontWeight.bold,
                            // fontStyle: FontStyle.italic,
                            fontFamily: 'Montserrat'),
                      ),
                    ),
                    Divider(),
                    // SizedBox(height: 20.0),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 190, 0),
                      child: Text(
                        'Buyers worked with',
                        style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 15.0,
                            // fontWeight: FontWeight.bold,
                            // fontStyle: FontStyle.italic,
                            fontFamily: 'Montserrat'),
                      ),
                    ),
                    Divider(),
                    // SizedBox(height: 20.0),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 230, 0),
                      child: Text(
                        'Last project',
                        style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 15.0,
                            // fontWeight: FontWeight.bold,
                            // fontStyle: FontStyle.italic,
                            fontFamily: 'Montserrat'),
                      ),
                    ),
                    Divider(),
                    SizedBox(height: 10.0),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 240, 0),
                      child: Text(
                        'About',
                        style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            // fontStyle: FontStyle.italic,
                            fontFamily: 'Montserrat'),
                      ),
                    ),
                  ],
                ))
          ],
        ));
  }
}

class getClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = new Path();

    path.lineTo(0.0, size.height / 2.5);
    path.lineTo(size.width + 125, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
