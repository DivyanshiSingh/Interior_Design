import 'package:flutter/material.dart';

class Pagefive extends StatefulWidget {
  @override
  _PagefiveState createState() => _PagefiveState();
}

class _PagefiveState extends State<Pagefive> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            children: <Widget>[
              Container(
                  width: double.infinity,
                  height: 300,
                  child: Image.asset('lib/images/favorite.jpg')),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Save your faves',
                  style: TextStyle(
                      fontSize: 22,
                      color: Colors.grey[600],
                      fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: 0.01 * MediaQuery.of(context).size.height,
                    left: 0.05 * MediaQuery.of(context).size.width,
                    right: 0.05 * MediaQuery.of(context).size.width),
                child: Text(
                  'Save items to read later or shortlist your favourites',
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[500],
                      fontWeight: FontWeight.w500),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: 0.05 * MediaQuery.of(context).size.height,
                    left: 0.7 * MediaQuery.of(context).size.width),
                child: FloatingActionButton(
                  onPressed: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => Form1(),
                    //   ),
                    // );
                  },
                  child: Icon(
                    Icons.create_new_folder,
                  ),
                  backgroundColor: Colors.amber,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
