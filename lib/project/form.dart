import 'package:flutter/material.dart';

class Form1 extends StatefulWidget {
  @override
  _Form1State createState() => _Form1State();
}

class _Form1State extends State<Form1> {
  Icon cusIcon = Icon(Icons.search);
  Widget cusSearchBar = Text('InsideOut');
  String _selected;
  bool _checkBoxValue = false;
  void onChanged(bool value) {
    setState(() {
      _checkBoxValue = value;
    });
  }

  List<Map> _myJson = [
    {"id": '1', "name": "Dining Room"},
    {"id": '2', "name": "Master Bedroom"},
    {"id": '3', "name": "Bedroom"},
    {"id": '4', "name": "Kids Room"},
    {"id": '5', "name": "Kitchen"},
    {"id": '6', "name": "Rooftop"},
    {"id": '7', "name": "Balcony"},
    {"id": '8', "name": "Stairs"},
    {"id": '9', "name": "Pool side"},
    {"id": '10', "name": "Bathroom"},
    {"id": '11', "name": "Lobby"},
    {"id": '12', "name": "Lawn"},
    {"id": '13', "name": "Garden Area"},
  ];
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
        body: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(8),
              child: Container(
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.grey),
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Expanded(
                        child: DropdownButtonHideUnderline(
                      child: ButtonTheme(
                        alignedDropdown: true,
                        child: DropdownButton<String>(
                          isDense: true,
                          hint: new Text("Place to Design"),
                          value: _selected,
                          onChanged: (String newValue) {
                            setState(() {
                              _selected = newValue;
                            });
                            print(_selected);
                          },
                          items: _myJson.map(
                            (Map map) {
                              return new DropdownMenuItem<String>(
                                value: map["id"].toString(),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Container(
                                      margin: EdgeInsets.only(left: 10),
                                      child: Text(
                                        map["name"],
                                      ),
                                    ),
                                    Checkbox(
                                      value: _checkBoxValue,
                                      activeColor: Colors.amber,
                                      onChanged: (bool value) {},
                                    ),
                                  ],
                                ),
                              );
                            },
                          ).toList(),
                        ),
                      ),
                    )),
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
