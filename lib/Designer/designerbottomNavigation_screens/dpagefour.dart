import 'package:flutter/material.dart';

class DPagefour extends StatefulWidget {
  @override
  _DPagefourState createState() => _DPagefourState();
}

class _DPagefourState extends State<DPagefour> {
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
                  child: Image.asset('lib/images/nomoney.jpg')),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'No financial history yet',
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
                  'Financial information will appear here after a project is completed',
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[500],
                      fontWeight: FontWeight.w500),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: 0.06 * MediaQuery.of(context).size.height,
                    left: 0.75 * MediaQuery.of(context).size.width),
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
