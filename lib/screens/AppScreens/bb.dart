


  
//   // dispose() {
//   //   _controller.dispose();
//   //   super.dispose();
//   // }

//   Widget build(BuildContext context) {
//     return GetMaterialApp(
// <<<<<<< HEAD
//       home: Scaffold(
//         body: Column(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           children: [
//             Image(
//                 image: NetworkImage(
//                     "https://4.bp.blogspot.com/-mVJvYwZkyGM/Xl_A_P5vyEI/AAAAAAAz9rU/5XwX4xRwZrwbLM9mLaxl-I7QRL1hv42dQCLcBGAsYHQ/s1600/AW4207455_15.gif")),
//             Container(
//                 alignment: Alignment.center,
//                 padding: EdgeInsets.all(10),
//                 child: Text(
//                   'Feeling dull?',
//                   style: TextStyle(
//                       color: Colors.black,
//                       //fontWeight: FontWeight.w500,
//                       fontSize: 15),
//                 )),
//             SizedBox(
//               height: 20,
// =======
//       debugShowCheckedModeBanner: false,
//       home: Center(
//           child: Column(
//         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         children: [
//           CircleAvatar(
//             radius: 90,
//             backgroundImage: AssetImage("assets/dull.png"),
//           ),
//           Container(
//               alignment: Alignment.center,
//               padding: EdgeInsets.all(10),
//               child: Text(
//                 'Feeling dull?',
//                 style: TextStyle(
//                     color: Colors.black,
//                     //fontWeight: FontWeight.w500,
//                     fontSize: 15),
//               )),
//           SizedBox(
//             height: 20,
//           ),
//           GestureDetector(
//             child: Container(
//               width: MediaQuery.of(context).size.width * 0.8,
//               alignment: Alignment.center,
//               decoration: BoxDecoration(
//                   color: Colors.purpleAccent,
//                   borderRadius: BorderRadius.circular(50.0)),
//               child: Padding(
//                 padding: const EdgeInsets.all(16.0),
//                 child: Text(
//                   'Play a random song!!',
//                   style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 18,
//                       fontStyle: FontStyle.italic),
//                   textAlign: TextAlign.center,
//                 ),
//               ),
// >>>>>>> fe7971feb89b8c01e5eca7d371e8b97279acb6a4
//             ),
//           ],
//         ),
//         floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
//         floatingActionButton: FloatingActionButton.extended(
//             onPressed: () async {
//               String url;
//               var random = new Random();
//               int x = random.nextInt(1000);
//               print(x);
//               if (x == 69) {
//                 url = await storage
//                     .ref()
//                     .child('songs/devm.mp3')
//                     .getDownloadURL();
//               } else {
//                 x = random.nextInt(9);
//                 url = await storage
//                     .ref()
//                     .child('songs/00' + x.toString() + '.mp3')
//                     .getDownloadURL();
//               }
//               print(url);
//               Get.bottomSheet(Container(
//                 color: Colors.white,
//                 height: 60,
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: [
//                     ElevatedButton(
//                         onPressed: () {
//                           stopAudio();
//                         },
//                         child: Text("Stop")),
//                     ElevatedButton(
//                         onPressed: () {
//                           playAudio(url);
//                         },
//                         child: Text("Play")),
//                     ElevatedButton(
//                         onPressed: () {
//                           pauseAudio();
//                         },
//                         child: Text("Pause")),
//                   ],
//                 ),
//               ));
//             },
//             icon: Icon(
//               Icons.music_note,
//               color: Colors.white,
//             ),
//             backgroundColor: Colors.purpleAccent,
//             label: Text("Play a random song")),
//       ),
//     );
//   }
// }