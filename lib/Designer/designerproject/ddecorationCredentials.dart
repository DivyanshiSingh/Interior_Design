import 'package:flutter/material.dart';

class DDecorationCredentials extends StatefulWidget {
  @override
  _DDecorationCredentialsState createState() => _DDecorationCredentialsState();
}

class _DDecorationCredentialsState extends State<DDecorationCredentials> {
  String dropdownValue;
  int _currentIndex = 0;
  Icon cusIcon = Icon(Icons.search);
  Widget cusSearchBar = Text('InsideOut');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        elevation: 0.1,
        backgroundColor: Colors.amber,
        title: Text(
          'InsideOut',
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
          )
        ],
      ),
      // =====INNER BODY=======
      body: Container(
        child: Column(
          children: <Widget>[
            Padding(
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
                    onChanged: (String newValue) {
                      setState(() {
                        dropdownValue = newValue;
                      });
                    },
                    items: <String>[
                      'Dining room',
                      'Master bedroom',
                      'Bedroom',
                      'Guestroom',
                      'Kitchen',
                      'Bathroom',
                      'Lawn',
                      'Lobby',
                      'Balcony',
                      'Stairs',
                      'Rooftop',
                      'Garden area',
                      'Pool side'
                    ].map<DropdownMenuItem<String>>((String value) {
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
            Padding(
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
                    onChanged: (String newValue) {
                      setState(() {
                        dropdownValue = newValue;
                      });
                    },
                    items: <String>[
                      'Dining room',
                      'Master bedroom',
                      'Bedroom',
                      'Guestroom',
                      'Kitchen',
                      'Bathroom',
                      'Lawn',
                      'Lobby',
                      'Balcony',
                      'Stairs',
                      'Rooftop',
                      'Garden area',
                      'Pool side'
                    ].map<DropdownMenuItem<String>>((String value) {
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
          ],
        ),
      ),
    );
  }
}
