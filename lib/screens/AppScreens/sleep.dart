import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wave/wave.dart';
import 'package:wave/config.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:firebase_storage/firebase_storage.dart';

// import 'package:audio_service/audio_service.dart';

class Sleep extends StatefulWidget {
  Sleep({Key key}) : super(key: key);

  @override
  _SleepState createState() => _SleepState();
}

class _SleepState extends State<Sleep> {
  @override
  // void initState() async {
  //   super.initState();
  //   ListResult listResult = await storage.ref().child('').list();
  //   setState(() {
  //     references = listResult.items;
  //     print(references);
  //   });
  // }

  AudioPlayer audioPlayer = AudioPlayer();

  playAudio(String url) {
    audioPlayer.play(url);
  }

  pauseAudio() {
    audioPlayer.pause();
  }

  stopAudio() {
    audioPlayer.stop();
  }

  List<Reference> references;
  var storage = FirebaseStorage.instance;

  Widget tile(String title) {
    return ListTile(
      leading: CircleAvatar(),
      title: Text(title),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 80,
              decoration: BoxDecoration(),
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              child: Text(
                'Connect your headphones and set the volume to a comfortable level.',
                style: TextStyle(fontSize: 15, color: Colors.black),
              ),
            ),
            SizedBox(height: 40),
            GestureDetector(
              child: tile("Relaxation, Stress Reduction"),
              onTap: () async {
                String url =
                    await storage.ref().child('Alpha.mp3').getDownloadURL();
                print(url);
                playAudio(url);
                Get.bottomSheet(Container(
                    height: 440,
                    color: Colors.white,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                stopAudio();
                              },
                              child: Text("Stop"),
                            ),
                          ],
                        ),
                      ],
                    )));
              },
            ),
            GestureDetector(
              child: tile("Awareness, Alertness"),
              onTap: () async {
                String url =
                    await storage.ref().child('Beta.mp3').getDownloadURL();
                print(url);
                playAudio(url);
                Get.bottomSheet(Container(
                    height: 440,
                    color: Colors.white,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                stopAudio();
                              },
                              child: Text("Stop"),
                            ),
                          ],
                        ),
                      ],
                    )));
              },
            ),
            GestureDetector(
              child: tile("REM Sleep. Power Naps"),
              onTap: () async {
                String url =
                    await storage.ref().child('Theta.mp3').getDownloadURL();
                print(url);
                playAudio(url);
                Get.bottomSheet(Container(
                    height: 440,
                    color: Colors.white,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                stopAudio();
                              },
                              child: Text("Stop"),
                            ),
                          ],
                        ),
                      ],
                    )));
              },
            ),
            GestureDetector(
              child: tile("Focus, Concentration, Information Processing"),
              onTap: () async {
                String url =
                    await storage.ref().child('Gamma.mp3').getDownloadURL();
                print(url);
                playAudio(url);
                Get.bottomSheet(Container(
                    height: 440,
                    color: Colors.white,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                stopAudio();
                              },
                              child: Text("Stop"),
                            ),
                          ],
                        ),
                      ],
                    )));
              },
            ),
            GestureDetector(
              child: tile("Deep Sleep. Recovery"),
              onTap: () async {
                String url =
                    await storage.ref().child('Delta.mp3').getDownloadURL();
                print(url);
                playAudio(url);
                Get.bottomSheet(Container(
                    height: 440,
                    color: Colors.white,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                stopAudio();
                              },
                              child: Text("Stop"),
                            ),
                          ],
                        ),
                      ],
                    )));
              },
            ),
            SizedBox(
              height: 40,
            ),
          ],
        ),
      ),
    );
  }
}

//
//
//
//
// //
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:wave/wave.dart';
// import 'package:wave/config.dart';
// import 'package:audioplayers/audioplayers.dart';
// import 'package:firebase_storage/firebase_storage.dart';

// // import 'package:audio_service/audio_service.dart';

// class Sleep extends StatefulWidget {
//   Sleep({Key key}) : super(key: key);

//   @override
//   _SleepState createState() => _SleepState();
// }

// class _SleepState extends State<Sleep> {
//   @override
//   // void initState() async {
//   //   super.initState();
//   //   ListResult listResult = await storage.ref().child('').list();
//   //   setState(() {
//   //     references = listResult.items;
//   //     print(references);
//   //   });
//   // }

//   AudioPlayer audioPlayer = AudioPlayer();

//   playAudio(String url) {
//     audioPlayer.play(url);
//   }

//   pauseAudio() {
//     audioPlayer.pause();
//   }

//   stopAudio() {
//     audioPlayer.stop();
//   }

//   List<Reference> references;
//   var storage = FirebaseStorage.instance;

//   Widget tile(String title) {
//     return ListTile(
//       leading: CircleAvatar(),
//       title: Text(title),
//     );
//   }

//   Widget Play(String url) {
//     return Container(
//       height: 40,
//       color: Colors.white,
//       child: Row(
//         children: [
//           ElevatedButton(
//             onPressed: () {
//               stopAudio();
//             },
//             child: Text("Stop"),
//           ),
//           ElevatedButton(
//             onPressed: () {
//               playAudio(url);
//             },
//             child: Text("Play"),
//           ),
//           ElevatedButton(
//             onPressed: () {
//               pauseAudio();
//             },
//             child: Text("Pause"),
//           ),
//         ],
//       ),
//     );
//   }

//   int _index = 0;
//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Container(
//             decoration: BoxDecoration(),
//             margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
//             child: Text(
//                 'Connect your headphones and set the volume to a comfortable level.'),
//           ),
//           SizedBox(height: 40),
//           GestureDetector(
//             child: tile("Relaxation, Stress Reduction"),
//             onTap: () async {
//               print("Relaxation, Stress Reduction");
//               String url =
//                   await storage.ref().child('Alpha.mp3').getDownloadURL();
//               print(url);
//               Get.bottomSheet(Play(url));
//             },
//           ),
//           GestureDetector(
//             child: tile("Awareness, Alertness"),
//             onTap: () async {
//               setState(() {
//                 _index = 2;
//               });
//               String url =
//                   await storage.ref().child('Beta.mp3').getDownloadURL();
//               print(url);
//               Get.bottomSheet(Play(url));
//             },
//           ),
//           GestureDetector(
//             child: tile("REM Sleep. Power Naps"),
//             onTap: () async {
//               setState(() {
//                 _index = 3;
//               });
//               String url =
//                   await storage.ref().child('Theta.mp3').getDownloadURL();
//               print(url);
//               playAudio(url);
//             },
//           ),
//           GestureDetector(
//             child: tile("Focus, Concentration, Information Processing"),
//             onTap: () async {
//               setState(() {
//                 _index = 4;
//               });
//               String url =
//                   await storage.ref().child('Gamma.mp3').getDownloadURL();
//               print(url);
//               playAudio(url);
//             },
//           ),
//           GestureDetector(
//             child: tile("Deep Sleep. Recovery"),
//             onTap: () async {
//               setState(() {
//                 _index = 5;
//               });
//               String url =
//                   await storage.ref().child('Delta.mp3').getDownloadURL();
//               print(url);
//               playAudio(url);
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }