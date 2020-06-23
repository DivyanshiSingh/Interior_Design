import 'package:flutter/material.dart';
import 'package:interiordesign/services/settings.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
                    MaterialPageRoute(builder: (context) => Settings()));
              },
            ),
          ],
        ),
        body: Stack(
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
                        image: DecorationImage(
                            image: NetworkImage(
                                'https://pixel.nymag.com/imgs/daily/vulture/2017/06/14/14-tom-cruise.w700.h700.jpg'),
                            fit: BoxFit.cover),
                        borderRadius: BorderRadius.all(Radius.circular(75.0)),
                      ),
                    ),
                    Column(
                      children: <Widget>[
                        SizedBox(height: 20.0),
                        Text(
                          'Tom Cruise',
                          style: TextStyle(
                              fontSize: 25.0,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Montserrat'),
                        ),
                        SizedBox(height: 10.0),
                        Text(
                          'Crawley,GB',
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 15.0,
                              fontFamily: 'Montserrat'),
                        ),
                        SingleChildScrollView(
                          child: Column(
                            children: <Widget>[
                              SizedBox(height: 5.0),
                              Padding(
                                padding: EdgeInsets.only(
                                  top:
                                      0.01 * MediaQuery.of(context).size.height,
                                ),
                                child: Text(
                                  'Insights',
                                  style: TextStyle(
                                      color: Colors.grey[600],
                                      fontSize: 23.0,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Montserrat'),
                                ),
                              ),
                              SizedBox(height: 5.0),
                              Divider(),
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(0, 0, 210, 0),
                                child: Text(
                                  'Projects listed',
                                  style: TextStyle(
                                      color: Colors.grey[600],
                                      fontSize: 15.0,
                                      fontFamily: 'Montserrat'),
                                ),
                              ),
                              Divider(),
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(0, 0, 170, 0),
                                child: Text(
                                  'Projects awarded (%)',
                                  style: TextStyle(
                                      color: Colors.grey[600],
                                      fontSize: 15.0,
                                      fontFamily: 'Montserrat'),
                                ),
                              ),
                              Divider(),
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(0, 0, 220, 0),
                                child: Text(
                                  'Freelancers',
                                  style: TextStyle(
                                      color: Colors.grey[600],
                                      fontSize: 15.0,
                                      fontFamily: 'Montserrat'),
                                ),
                              ),
                              Divider(),
                              Row(
                                children: <Widget>[
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(10, 0, 0, 0),
                                    child: Text(
                                      'About',
                                      style: TextStyle(
                                          color: Colors.grey[600],
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'Montserrat'),
                                    ),
                                  ),
                                  IconButton(
                                    icon: Icon(
                                      Icons.save,
                                      color: Colors.amber,
                                    ),
                                    onPressed: () {
                                      //
                                    },
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 60,
                                child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(10, 0, 10, 0),
                                  child: TextFormField(
                                    decoration: new InputDecoration(
                                        hintText: "add lines for yourself",
                                        border: new OutlineInputBorder(
                                          borderRadius: const BorderRadius.all(
                                            const Radius.circular(10.0),
                                          ),
                                        ),
                                        filled: true,
                                        hintStyle: new TextStyle(
                                            color: Colors.grey[500],
                                            fontSize: 13),
                                        fillColor: Colors.white70),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    )
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
