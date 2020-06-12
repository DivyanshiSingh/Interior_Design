import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:firebase_core/firebase_core.dart';

// final FirebaseApp app = FirebaseApp(
//   options: FirebaseOptions(
//     googleAppID: '1:432610355640:android:39bae17a1b9e7f5b50c74d',
//     apiKey: "AIzaSyBTVfFCNcfEX6n9wzfwPI7qqb5Jt2f9WXs",
//     databaseURL: "https://insideout-cb93a.firebaseio.com",
//   ),
// );

class DFeedbackPage extends StatefulWidget {
  @override
  _DFeedbackPageState createState() => _DFeedbackPageState();
}

class _DFeedbackPageState extends State<DFeedbackPage> {
  List<Item> items = List();
  Item item;
  DatabaseReference itemRef;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  // void initState() {
  //   super.initState();
  //   item = Item(" ", " ");
  //   final FirebaseDatabase database = FirebaseDatabase(app: app);
  //   itemRef = database.reference().child('items');
  //   itemRef.onChildAdded.listen(_onEntryAdded);
  //   itemRef.onChildChanged.listen(_onEntryChanged);
  //   // itemRef = FirebaseDatabase.instance.reference().child('items');
  // }

  _onEntryAdded(Event event) {
    setState(() {
      items.add(Item.fromSnapshots(event.snapshot));
    });
  }

  _onEntryChanged(Event event) {
    var old = items.singleWhere((entry) {
      return entry.key == event.snapshot.key;
    });
    setState(() {
      items[items.indexOf(old)] = Item.fromSnapshots(event.snapshot);
    });
  }

  void handleSubmit() {
    final FormState form = formKey.currentState;
    if (form.validate()) {
      form.save();
      form.reset();
      itemRef.push().set(item.toJson());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        elevation: 0.1,
        backgroundColor: Colors.amber,
        title: Text(
          'Feedback',
        ),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.white,
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.fromLTRB(15, 20, 0, 0),
              child: Text(
                'Your feedback is valuable to us, please explain briefly what could improve',
                style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 16,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(10, 50, 0, 0),
              child: Form(
                key: formKey,
                child: TextFormField(
                  maxLines: 8,
                  decoration: InputDecoration.collapsed(
                      hintText: "Feedback here please"),
                  // onSaved:(val)=> item.title=val,
                  onSaved: (val) => item.body = val,
                  validator: (val) => val = "" != null ? val : null,
                ),
              ),
            ),
            Flexible(
              child: FirebaseAnimatedList(
                query: itemRef,
                itemBuilder: (BuildContext context, DataSnapshot snapshot,
                    Animation<double> animation, int index) {
                  return new ListTile(
                    leading: Icon(Icons.message),
                    title: Text(items[index].title),
                    subtitle: Text(items[index].body),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 280, 20, 10),
              child: SizedBox(
                height: 45,
                width: double.infinity,
                child: RaisedButton(
                  color: Colors.amber,
                  // textColor: Colors.grey,
                  padding: EdgeInsets.all(2.0),
                  onPressed: () {
                    handleSubmit();
                    // signOutGoogle();
                    // Navigator.pushReplacement(context,
                    //     MaterialPageRoute(builder: (context) => Login()));
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => Home(),
                    //   ),
                    // );
                  },
                  child: Text(
                    "SUBMIT FEEDBACK",
                    style: TextStyle(fontSize: 23.0, color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Item {
  String key;
  String title;
  String body;
  Item(this.title, this.body);
  Item.fromSnapshots(DataSnapshot snapshot)
      : key = snapshot.key,
        title = snapshot.value['title'],
        body = snapshot.value['body'];
  toJson() {
    return {
      "title": title,
      "body": body,
    };
  }
}
