import 'package:flutter/material.dart';
import 'package:interiordesign/Designer/designerproject/dform.dart';

class DPagetwo extends StatefulWidget {
  @override
  _DPagetwoState createState() => _DPagetwoState();
}

class _DPagetwoState extends State<DPagetwo> {
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
                  'No invitations yet',
                  style: TextStyle(
                      fontSize: 22,
                      color: Colors.grey[600],
                      fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: 0.02 * MediaQuery.of(context).size.height,
                    left: 0.08 * MediaQuery.of(context).size.width),
                child: Text(
                  'Projects will start appearing here once you get invited by the buyers.',
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[500],
                      fontWeight: FontWeight.w500),
                ),
              ),
              // Padding(
              //   padding: const EdgeInsets.all(5.0),
              //   child: Text(
              //     'invited by the buyers.',
              //     style: TextStyle(
              //         fontSize: 16,
              //         color: Colors.grey[500],
              //         fontWeight: FontWeight.w500),
              //   ),
              // ),
              Padding(
                padding: EdgeInsets.only(
                    top: 0.05 * MediaQuery.of(context).size.height,
                    left: 0.7 * MediaQuery.of(context).size.width),
                child: FloatingActionButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DForm1(),
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
