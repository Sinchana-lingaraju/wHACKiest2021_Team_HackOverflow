// return GetMaterialApp(
//       home: Scaffold(
//         body: Column(
//           children: [
//             Container(
//               padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
//               child: Text(
//                   "Hello " + FirebaseAuth.instance.currentUser.displayName),
//             ),
//           ],
//         ),
//         floatingActionButton: FloatingActionButton(
//           child: Icon(Icons.add_box),
//           onPressed: () {
//             Get.bottomSheet(SingleChildScrollView(
//               child: Container(
//                 color: Colors.white,
//                 child: Column(
//                   children: [
//                     Text("Title: "),
//                     TextField(),
//                     Text("Content: "),
//                     TextField(),
//                     Text("How's you feelin!!"),
//                     SfSlider(
//                       min: 0.0,
//                       max: 100.0,
//                       value: 100.0,
//                       interval: 20,
//                       showTicks: true,
//                       showLabels: true,
//                       enableTooltip: true,
//                       minorTicksPerInterval: 1,
//                       onChanged: (dynamic value) {
//                         setState(() {
//                           _currentMood = value;
//                         });
//                       },
//                     ),
//                   ],
//                 ),
//               ),
//             ));
//           },
//         ),
//       ),
//     );