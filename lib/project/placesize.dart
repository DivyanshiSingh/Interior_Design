import 'package:flutter/material.dart';
import '../project/uploadimage.dart';

class Form1 extends StatefulWidget {
  @override
  _Form1State createState() => _Form1State();
}

class _Form1State extends State<Form1> {
  Icon cusIcon = Icon(Icons.search);
  Widget cusSearchBar = Text('InsideOut');
  Map<String, bool> values = {
    "Dining Room": false,
    "Master Bedroom": false,
    "Bedroom": false,
    "Kids Room": false,
    "Kitchen": false,
    "Rooftop": false,
    "Balcony": false,
    "Stairs": false,
    "Pool side": false,
    "Bathroom": false,
    "Lobby": false,
    "Lawn": false,
    "Garden Area": false,
  };
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        elevation: 0.1,
        backgroundColor: Colors.amber,
        title: Text(
          'Place to Decorate',
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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: values.keys.map((String key) {
            return new CheckboxListTile(
              activeColor: Colors.amber,
              title: new Text(
                key,
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              value: values[key],
              onChanged: (bool value) {
                setState(
                  () {
                    values[key] = value;
                  },
                );
              },
              subtitle: Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.amber[50],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(8.0, 0, 0, 0),
                        child: TextField(
                          decoration: InputDecoration(
                              border: InputBorder.none, hintText: 'length'),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.amber[50],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(8.0, 0, 0, 0),
                        child: TextField(
                          decoration: InputDecoration(
                              border: InputBorder.none, hintText: 'breadth'),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.amber[50],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(8.0, 0, 0, 0),
                        child: TextField(
                          decoration: InputDecoration(
                              border: InputBorder.none, hintText: 'height'),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.amber[50],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(8.0, 0, 0, 0),
                        child: TextField(
                          decoration: InputDecoration(
                              border: InputBorder.none, hintText: 'Quantity'),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                    child: Material(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.amber,
                      elevation: 0.0,
                      child: MaterialButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ImagePickerWidget(),
                              ),
                            );
                          },
                          minWidth: 350,
                          // MediaQuery.of(context).size.width,
                          child: Text("Upload Image",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 17,
                                  color: Colors.white))),
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
