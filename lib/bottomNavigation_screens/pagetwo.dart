import 'package:flutter/material.dart';
import '../project/camera.dart';
import '../project/uploadimage.dart';
import '../project/decorationCredentials.dart';
import '../project/placesize.dart';

class Pagetwo extends StatefulWidget {
  @override
  _PagetwoState createState() => _PagetwoState();
}

class _PagetwoState extends State<Pagetwo> {
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
                  child: Image.asset('lib/images/noproject.jpg')),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'No projects yet',
                  style: TextStyle(
                      fontSize: 22,
                      color: Colors.grey[600],
                      fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Text(
                  'post your first project',
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[500],
                      fontWeight: FontWeight.w500),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(250, 90, 5, 5),
                child: FloatingActionButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Form1(),
                      ),
                    );
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
