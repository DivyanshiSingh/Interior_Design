// import 'package:flutter/material.dart';

// // import 'package:travel_budget/widgets/provider_widget.dart';
// class Profile extends StatefulWidget {
//   @override
//   _ProfileState createState() => _ProfileState();
// }

// class _ProfileState extends State<Profile> {
//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child: Column(
//         children: <Widget>[
//           FutureBuilder(
//             future: Provider.of(context).auth.getCurrentUID(),
//             builder: (context, snapshot) {
//               if (snapshot.connectionState == ConnectionState.done) {
//                 return Text("${snapshot.data}");
//               } else {
//                 return CircularProgressIndicator();
//               }
//             },
//           )
//         ],
//       ),
//     );
//   }
// }
