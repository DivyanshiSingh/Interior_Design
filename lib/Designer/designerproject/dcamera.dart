import 'dart:async';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';

void main() => runApp(new DCamera());

class DCamera extends StatefulWidget {
  @override
  _DCameraState createState() => _DCameraState();
}

class _DCameraState extends State<DCamera> {
  get _image => null;

  // final File_image;
  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      var _image = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Image Picker',
        home: new Scaffold(
          // appBar: new AppBar(
          //   backgroundColor: Colors.yellowAccent,
          //   title: new Text(
          //     'Image Picker',
          //     style: TextStyle(color: Colors.brown),
          //   ),
          // ),
          body: Column(
            children: <Widget>[
              ClipPath(
                clipper: MyClipper(),
                child: Container(
                  height: 320,
                  decoration: BoxDecoration(color: Colors.amber),
                  child: Center(
                    child: Text(
                      "Capture Image",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 45),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(100.0),
                child: _image == null
                    ? new
                        // Stack(
                        //     children: [
                        //       Positioned(
                        //         bottom: 20,
                        //         // right: 50,

                        Text(
                        'No image selected',
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      )
                    : new Image.file(_image),
              ),
            ],
          ),
          floatingActionButton: new FloatingActionButton(
            backgroundColor: Colors.amber,
            onPressed: getImage,
            tooltip: 'Pick Image',
            child: new Icon(Icons.camera),
          ),
        ));
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = new Path();
    path.lineTo(0, size.height - 70);
    var controllPoint = Offset(50, size.height);
    var endPoint = Offset(size.width / 2, size.height);
    path.quadraticBezierTo(
        controllPoint.dx, controllPoint.dy, endPoint.dx, endPoint.dy);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
