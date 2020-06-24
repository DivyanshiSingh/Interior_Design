import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/services.dart';

class EditProfile extends StatefulWidget {
  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  String _fileName;
  String _path;
  Map<String, String> _paths;
  String _extension;
  bool _loadingPath = false;
  bool _multiPick = false;
  FileType _pickingType = FileType.any;
  TextEditingController _controller = new TextEditingController();
  int selectedRadio;
  int selectedRadioTile;

  @override
  void initState() {
    super.initState();
    _controller.addListener(() => _extension = _controller.text);
    selectedRadio = 0;
    selectedRadioTile = 0;
  }

  void _openFileExplorer() async {
    setState(() => _loadingPath = true);
    try {
      if (_multiPick) {
        _path = null;
        _paths = await FilePicker.getMultiFilePath(
            type: _pickingType,
            allowedExtensions: (_extension?.isNotEmpty ?? false)
                ? _extension?.replaceAll(' ', '')?.split(',')
                : null);
      } else {
        _paths = null;
        _path = await FilePicker.getFilePath(
            type: _pickingType,
            allowedExtensions: (_extension?.isNotEmpty ?? false)
                ? _extension?.replaceAll(' ', '')?.split(',')
                : null);
      }
    } on PlatformException catch (e) {
      print("Unsupported operation" + e.toString());
    }
    if (!mounted) return;
    setState(() {
      _loadingPath = false;
      _fileName = _path != null
          ? _path.split('/').last
          : _paths != null ? _paths.keys.toString() : '...';
    });
  }

  setSelectedRadio(int val) {
    setState(() {
      selectedRadio = val;
    });
  }

  setSelectedRadioTile(int val) {
    setState(() {
      selectedRadioTile = val;
    });
  }

  // String radioItem = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        elevation: 0.1,
        backgroundColor: Colors.amber,
        title: Text(
          'Edit Profile',
        ),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Center(
                child: Text(
                  "Edit your Profile",
                  style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
              ),
              // Padding(
              //   padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
              Center(
                child: Text(
                  "Fill in your profile information",
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 15,
                    // fontWeight: FontWeight.bold
                  ),
                ),
              ),
              SizedBox(height: 15),

              Padding(
                padding: EdgeInsets.only(
                    left: 0.05 * MediaQuery.of(context).size.width),
                child: Text(
                  "FIRST NAME",
                  style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 40,
                child: Padding(
                  padding: EdgeInsets.only(
                      left: 0.04 * MediaQuery.of(context).size.width,
                      right: 0.04 * MediaQuery.of(context).size.width),
                  child: TextFormField(
                    decoration: new InputDecoration(
                        border: new OutlineInputBorder(
                          borderRadius: const BorderRadius.all(
                            const Radius.circular(10.0),
                          ),
                        ),
                        filled: true,
                        hintStyle: new TextStyle(color: Colors.grey[800]),
                        fillColor: Colors.white70),
                  ),
                ),
              ),
              SizedBox(height: 15),
              Padding(
                padding: EdgeInsets.only(
                    left: 0.05 * MediaQuery.of(context).size.width),
                child: Text(
                  "LAST NAME",
                  style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 40,
                child: Padding(
                  padding: EdgeInsets.only(
                      left: 0.04 * MediaQuery.of(context).size.width,
                      right: 0.04 * MediaQuery.of(context).size.width),
                  child: TextFormField(
                    decoration: new InputDecoration(
                        border: new OutlineInputBorder(
                          borderRadius: const BorderRadius.all(
                            const Radius.circular(10.0),
                          ),
                        ),
                        filled: true,
                        hintStyle: new TextStyle(color: Colors.grey[800]),
                        fillColor: Colors.white70),
                  ),
                ),
              ),
              SizedBox(height: 15),
              Padding(
                padding: EdgeInsets.only(
                    left: 0.05 * MediaQuery.of(context).size.width),
                child: Text(
                  "DO YOU REPRESENT A COMPANY?",
                  style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
              ),
              RadioListTile(
                value: 1,
                groupValue: selectedRadioTile,
                activeColor: Colors.amber,
                title: Text(
                  "No",
                  style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
                onChanged: (val) {
                  print("Radio tile pressed $val");
                  setSelectedRadioTile(val);
                },
                selected: true,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 120, 0),
                child: RadioListTile(
                  value: 2,
                  groupValue: selectedRadioTile,
                  activeColor: Colors.amber,
                  title: Text(
                    "YES",
                    style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                  onChanged: (val) {
                    print("Radio tile pressed $val");
                    setSelectedRadioTile(val);
                  },
                ),
              ),
              SizedBox(height: 15),
              Padding(
                padding: EdgeInsets.only(
                    left: 0.05 * MediaQuery.of(context).size.width),
                child: Text(
                  "JOB TITLE",
                  style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 40,
                child: Padding(
                  padding: EdgeInsets.only(
                      left: 0.04 * MediaQuery.of(context).size.width,
                      right: 0.04 * MediaQuery.of(context).size.width),
                  child: TextFormField(
                    decoration: new InputDecoration(
                        hintText: "Example: Designer...",
                        border: new OutlineInputBorder(
                          borderRadius: const BorderRadius.all(
                            const Radius.circular(10.0),
                          ),
                        ),
                        filled: true,
                        hintStyle: new TextStyle(
                            color: Colors.grey[500], fontSize: 13),
                        fillColor: Colors.white70),
                  ),
                ),
              ),
              SizedBox(height: 15),
              Padding(
                padding: EdgeInsets.only(
                    left: 0.05 * MediaQuery.of(context).size.width),
                child: Text(
                  "COVER IMAGE (RECOMMENDED)",
                  style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: 0.04 * MediaQuery.of(context).size.width,
                    right: 0.04 * MediaQuery.of(context).size.width),
                child: Container(
                  height: 150,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.amber[100],
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        FlatButton(
                          color: Colors.amber[100],
                          onPressed: () => _openFileExplorer(),
                          child: new Text(
                            "Pick file to add attachment",
                            style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        new Builder(
                          builder: (BuildContext context) => _loadingPath
                              ? Padding(
                                  padding: const EdgeInsets.only(bottom: 10.0),
                                  child: const CircularProgressIndicator())
                              : _path != null || _paths != null
                                  ? new Container(
                                      padding:
                                          const EdgeInsets.only(bottom: 30.0),
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.50,
                                      child: new Scrollbar(
                                          child: new ListView.separated(
                                        itemCount:
                                            _paths != null && _paths.isNotEmpty
                                                ? _paths.length
                                                : 1,
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          final bool isMultiPath =
                                              _paths != null &&
                                                  _paths.isNotEmpty;
                                          final String name = 'File $index: ' +
                                              (isMultiPath
                                                  ? _paths.keys.toList()[index]
                                                  : _fileName ?? '...');
                                          final path = isMultiPath
                                              ? _paths.values
                                                  .toList()[index]
                                                  .toString()
                                              : _path;

                                          return new ListTile(
                                            title: new Text(
                                              name,
                                            ),
                                            subtitle: new Text(path),
                                          );
                                        },
                                        separatorBuilder:
                                            (BuildContext context, int index) =>
                                                new Divider(),
                                      )),
                                    )
                                  : new Container(),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 15),
              Padding(
                padding: EdgeInsets.only(
                    left: 0.05 * MediaQuery.of(context).size.width),
                child: Text(
                  "PROFILE PICTURE (RECOMMENDED)",
                  style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: 0.04 * MediaQuery.of(context).size.width,
                    right: 0.04 * MediaQuery.of(context).size.width),
                child: Container(
                  height: 150,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.amber[100],
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        FlatButton(
                          color: Colors.amber[100],
                          onPressed: () => _openFileExplorer(),
                          child: new Text(
                            "Pick file to add attachment",
                            style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        new Builder(
                          builder: (BuildContext context) => _loadingPath
                              ? Padding(
                                  padding: const EdgeInsets.only(bottom: 10.0),
                                  child: const CircularProgressIndicator())
                              : _path != null || _paths != null
                                  ? new Container(
                                      padding:
                                          const EdgeInsets.only(bottom: 30.0),
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.50,
                                      child: new Scrollbar(
                                          child: new ListView.separated(
                                        itemCount:
                                            _paths != null && _paths.isNotEmpty
                                                ? _paths.length
                                                : 1,
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          final bool isMultiPath =
                                              _paths != null &&
                                                  _paths.isNotEmpty;
                                          final String name = 'File $index: ' +
                                              (isMultiPath
                                                  ? _paths.keys.toList()[index]
                                                  : _fileName ?? '...');
                                          final path = isMultiPath
                                              ? _paths.values
                                                  .toList()[index]
                                                  .toString()
                                              : _path;

                                          return new ListTile(
                                            title: new Text(
                                              name,
                                            ),
                                            subtitle: new Text(path),
                                          );
                                        },
                                        separatorBuilder:
                                            (BuildContext context, int index) =>
                                                new Divider(),
                                      )),
                                    )
                                  : new Container(),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: 0.05 * MediaQuery.of(context).size.width),
                child: Text(
                  "PER PROJECT RATE IN POUND",
                  style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 40,
                child: Padding(
                  padding: EdgeInsets.only(
                      left: 0.04 * MediaQuery.of(context).size.width,
                      right: 0.04 * MediaQuery.of(context).size.width),
                  child: TextFormField(
                    decoration: new InputDecoration(
                        hintText: "add rate",
                        border: new OutlineInputBorder(
                          borderRadius: const BorderRadius.all(
                            const Radius.circular(10.0),
                          ),
                        ),
                        filled: true,
                        hintStyle: new TextStyle(
                            color: Colors.grey[500], fontSize: 13),
                        fillColor: Colors.white70),
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: 0.05 * MediaQuery.of(context).size.width),
                child: Text(
                  "PHONE",
                  style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 40,
                child: Padding(
                  padding: EdgeInsets.only(
                      left: 0.04 * MediaQuery.of(context).size.width,
                      right: 0.04 * MediaQuery.of(context).size.width),
                  child: TextFormField(
                    decoration: new InputDecoration(
                        hintText: "add contact number",
                        border: new OutlineInputBorder(
                          borderRadius: const BorderRadius.all(
                            const Radius.circular(10.0),
                          ),
                        ),
                        filled: true,
                        hintStyle: new TextStyle(
                            color: Colors.grey[500], fontSize: 13),
                        fillColor: Colors.white70),
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: 0.05 * MediaQuery.of(context).size.width),
                child: Text(
                  "ABOUT YOU",
                  style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: 0.04 * MediaQuery.of(context).size.width,
                    right: 0.04 * MediaQuery.of(context).size.width),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.amber[100],
                    // boxShadow: [
                    //   BoxShadow(color: Colors.green, spreadRadius: 3),
                    // ],
                  ),
                  height: 150,
                  width: MediaQuery.of(context).size.width,
                  // color: Colors.amber,
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: TextField(
                      maxLines: 8,
                      decoration: InputDecoration.collapsed(
                          hintText: "Enter your text here"),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 15),
              Padding(
                padding: EdgeInsets.only(
                    left: 0.05 * MediaQuery.of(context).size.width),
                child: Text(
                  "YOUR PROFILE SKILLS",
                  style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 40,
                child: Padding(
                  padding: EdgeInsets.only(
                      left: 0.04 * MediaQuery.of(context).size.width,
                      right: 0.04 * MediaQuery.of(context).size.width),
                  child: TextFormField(
                    decoration: new InputDecoration(
                        hintText: "Type here to add...",
                        border: new OutlineInputBorder(
                          borderRadius: const BorderRadius.all(
                            const Radius.circular(10.0),
                          ),
                        ),
                        filled: true,
                        hintStyle: new TextStyle(
                            color: Colors.grey[500], fontSize: 13),
                        fillColor: Colors.white70),
                  ),
                ),
              ),
              SizedBox(height: 5),
              Row(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(
                        left: 0.05 * MediaQuery.of(context).size.width),
                    child: Text(
                      "Can't find a skill?",
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.grey[600],
                        fontFamily: 'Open Sans',
                        decoration: TextDecoration.none,
                      ),
                    ),
                  ),
                  Material(
                    child: InkWell(
                      child: Text(
                        "Contact Us",
                        style: TextStyle(
                            fontSize: 13,
                            color: Colors.amber,
                            fontFamily: 'Open Sans',
                            decoration: TextDecoration.none,
                            fontWeight: FontWeight.bold),
                      ),
                      onTap: () {},
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: 0.05 * MediaQuery.of(context).size.width),
                child: Text(
                  "INDUSTRY EXPERTISE (MAX 5)",
                  style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 40,
                child: Padding(
                  padding: EdgeInsets.only(
                      left: 0.04 * MediaQuery.of(context).size.width,
                      right: 0.04 * MediaQuery.of(context).size.width),
                  child: TextFormField(
                    decoration: new InputDecoration(
                        hintText: "Nothing added",
                        border: new OutlineInputBorder(
                          borderRadius: const BorderRadius.all(
                            const Radius.circular(10.0),
                          ),
                        ),
                        filled: true,
                        hintStyle: new TextStyle(
                            color: Colors.grey[500], fontSize: 13),
                        fillColor: Colors.white70),
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: 0.05 * MediaQuery.of(context).size.width),
                child: Text(
                  "PORTFOLIO (OPTIONAL)",
                  style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: 0.04 * MediaQuery.of(context).size.width,
                    right: 0.04 * MediaQuery.of(context).size.width),
                child: Container(
                  height: 150,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.amber[100],
                    // boxShadow: [
                    //   BoxShadow(color: Colors.green, spreadRadius: 3),
                    // ],
                  ),
                  // color: Colors.amber[100],
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        FlatButton(
                          color: Colors.amber[100],
                          onPressed: () => _openFileExplorer(),
                          child: new Text(
                            "Pick file to add attachment",
                            style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        new Builder(
                          builder: (BuildContext context) => _loadingPath
                              ? Padding(
                                  padding: const EdgeInsets.only(bottom: 10.0),
                                  child: const CircularProgressIndicator())
                              : _path != null || _paths != null
                                  ? new Container(
                                      padding:
                                          const EdgeInsets.only(bottom: 30.0),
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.50,
                                      child: new Scrollbar(
                                          child: new ListView.separated(
                                        itemCount:
                                            _paths != null && _paths.isNotEmpty
                                                ? _paths.length
                                                : 1,
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          final bool isMultiPath =
                                              _paths != null &&
                                                  _paths.isNotEmpty;
                                          final String name = 'File $index: ' +
                                              (isMultiPath
                                                  ? _paths.keys.toList()[index]
                                                  : _fileName ?? '...');
                                          final path = isMultiPath
                                              ? _paths.values
                                                  .toList()[index]
                                                  .toString()
                                              : _path;

                                          return new ListTile(
                                            title: new Text(
                                              name,
                                            ),
                                            subtitle: new Text(path),
                                          );
                                        },
                                        separatorBuilder:
                                            (BuildContext context, int index) =>
                                                new Divider(),
                                      )),
                                    )
                                  : new Container(),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 15),
              Padding(
                padding: EdgeInsets.only(
                    left: 0.05 * MediaQuery.of(context).size.width),
                child: Text(
                  "LOCATION (CITY)",
                  style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 40,
                child: Padding(
                  padding: EdgeInsets.only(
                      left: 0.04 * MediaQuery.of(context).size.width,
                      right: 0.04 * MediaQuery.of(context).size.width),
                  child: TextFormField(
                    decoration: new InputDecoration(
                        hintText: "Crawley, GB",
                        border: new OutlineInputBorder(
                          borderRadius: const BorderRadius.all(
                            const Radius.circular(10.0),
                          ),
                        ),
                        filled: true,
                        hintStyle: new TextStyle(
                            color: Colors.grey[500], fontSize: 13),
                        fillColor: Colors.white70),
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              // Padding(
              //   padding: EdgeInsets.only(
              //       left: 0.04 * MediaQuery.of(context).size.width,
              //       right: 0.04 * MediaQuery.of(context).size.width),
              Center(
                child: Container(
                  height: 50.0,
                  width: 200,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          // builder: (context) => EditProfile(),
                          builder: (context) => EditProfile(),
                        ),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.amber,
                          style: BorderStyle.solid,
                          width: 2.0,
                        ),
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Center(
                            child: Text(
                              "DONE",
                              style: TextStyle(
                                color: Colors.amber,
                                fontFamily: 'Montserrat',
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 1,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 15),
            ],
          ),
        ),
      ),
    );
  }
}
