import 'package:flutter/material.dart';

class Pagethree extends StatefulWidget {
  @override
  _PagethreeState createState() => _PagethreeState();
}

class _PagethreeState extends State<Pagethree> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            children: <Widget>[
              Container(
                  width: 300,
                  height: 300,
                  child: Image.asset('lib/images/nomessage.jpg')),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'No messages yet',
                  style: TextStyle(
                      fontSize: 22,
                      color: Colors.grey[600],
                      fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Text(
                  'Start your chat with your designer',
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[500],
                      fontWeight: FontWeight.w500),
                ),
              ),
              // Padding(
              //   padding: const EdgeInsets.fromLTRB(250, 90, 5, 5),
              //   child: FloatingActionButton(
              //     onPressed: () {
              //       // Navigator.push(
              //       //   context,
              //       //   MaterialPageRoute(
              //       //     builder: (context) => Form1(),
              //       //   ),
              //       // );
              //     },
              //     child: Icon(
              //       Icons.create_new_folder,
              //     ),
              //     backgroundColor: Colors.amber,
              //   ),
              // )
            ],
          ),
        ),
      ),
    );
  }
}
