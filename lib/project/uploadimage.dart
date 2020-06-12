import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/widgets.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';

class ImagePickerWidget extends StatefulWidget {
  ImagePickerWidget({Key key}) : super(key: key);
  @override
  _ImagePickerState createState() => _ImagePickerState();
}

class _ImagePickerState extends State<ImagePickerWidget> {
  File _image;
  Icon cusIcon = Icon(Icons.search);
  Widget cusSearchBar = Text('InsideOut');
  @override
  void initState() {
    super.initState();
  }

  // ======   FOR OPENING CAMERA    ======
  void open_camera() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      _image = image;
    });
  }

  // ======    FOR OPENING GALLERY    ======
  void open_gallery() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = image;
      print(_image);
    });
  }

  @override
  Widget build(BuildContext context) {
    // Future uploadPic(BuildContext context) async {
    //   String filName = basename(_image.path);
    //   StorageReference firebaseStorageRef =
    //       FirebaseStorage.instance.ref().child(filName);
    //   StorageUploadTask uploadTask = firebaseStorageRef.putFile(_image);
    //   StorageTaskSnapshot taskSnapshot = await uploadTask.onComplete;
    //   setState(() {
    //     print("Profile Picture uploaded");
    //     Scaffold.of(context).showSnackBar(SnackBar(
    //       content: Text('Room picture uploaded'),
    //     ));
    //   });
    // }

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
        body: Builder(
          builder: (context) => Container(
            child: Column(
              children: <Widget>[
                Center(
                    child: Container(
                  child: Column(
                    children: <Widget>[
                      Container(
                        child: _image == null
                            ? Text('Still waiting!')
                            : Image.file(_image),
                      ),
                      FlatButton(
                        child: Text('Open Camera'),
                        onPressed: () {
                          open_camera();
                        },
                      ),
                      FlatButton(
                        child: Text('Open Gallery'),
                        onPressed: () {
                          open_gallery();
                        },
                      ),
                      // FlatButton(
                      //   child: Text('Submit'),
                      //   onPressed: () {
                      //     uploadPic(context);
                      //   },
                      // ),
                      Uploader(file: _image)
                    ],
                  ),
                )),
              ],
            ),
          ),
        ));
  }
}

class Uploader extends StatefulWidget {
  final File file;
  Uploader({Key key, this.file}) : super(key: key);
  @override
  _UploaderState createState() => _UploaderState();
}

class _UploaderState extends State<Uploader> {
  final FirebaseStorage _storage =
      FirebaseStorage(storageBucket: 'gs://insideout-cb93a.appspot.com');
  StorageUploadTask _uploadTask;
  void _startUpload() {
    String filePath = 'images/${DateTime.now()}.png';
    setState(() {
      _uploadTask = _storage.ref().child(filePath).putFile(widget.file);
    });
  }
  // noooooooooooooooo

  @override
  Widget build(BuildContext context) {
    if (_uploadTask != null) {
      return StreamBuilder<StorageTaskEvent>(
          stream: _uploadTask.events,
          builder: (context, snapshot) {
            var event = snapshot?.data?.snapshot;
            double progressPercent = event != null
                ? event.bytesTransferred / event.totalByteCount
                : 0;
            return Column(
              children: <Widget>[
                if (_uploadTask.isComplete) Text('Bravo'),
                if (_uploadTask.isPaused)
                  FlatButton(
                    child: Icon(Icons.play_arrow),
                    onPressed: _uploadTask.resume,
                  ),
                if (_uploadTask.isInProgress)
                  FlatButton(
                    child: Icon(Icons.pause),
                    onPressed: _uploadTask.pause,
                  ),
                LinearProgressIndicator(value: progressPercent),
                Text('${(progressPercent * 100).toStringAsFixed(2)}%'),
              ],
            );
          });
    } else {
      return FlatButton.icon(
        label: Text('Upload to Firebase'),
        icon: Icon(Icons.cloud_upload),
        onPressed: _startUpload,
      );
    }
  }
}
