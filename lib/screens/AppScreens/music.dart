import 'package:flutter/material.dart';
import 'dart:math';
import 'package:audioplayers/audioplayers.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/route_manager.dart';

class Music extends StatelessWidget {
  // const Music({Key key}) : super(key: key);
  AudioPlayer audioPlayer = AudioPlayer();
  var storage = FirebaseStorage.instance;

  playAudio(String url) {
    audioPlayer.play(url);
  }

  pauseAudio() {
    audioPlayer.pause();
  }

  stopAudio() {
    audioPlayer.stop();
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CircleAvatar(
            radius: 90,
            backgroundImage: AssetImage("assets/dull.png"),
          ),
          Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(10),
              child: Text(
                'Feeling dull?',
                style: TextStyle(
                    color: Colors.black,
                    //fontWeight: FontWeight.w500,
                    fontSize: 15),
              )),
          SizedBox(
            height: 20,
          ),
          GestureDetector(
            child: Container(
              width: MediaQuery.of(context).size.width * 0.8,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: Colors.purpleAccent,
                  borderRadius: BorderRadius.circular(50.0)),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Play a random song!!',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            onTap: () async {
              String url;
              var random = new Random();
              int x = random.nextInt(1000);
              print(x);
              if (x == 69) {
                url = await storage
                    .ref()
                    .child('songs/devm.mp3')
                    .getDownloadURL();
              } else {
                x = random.nextInt(9);
                url = await storage
                    .ref()
                    .child('songs/00' + x.toString() + '.mp3')
                    .getDownloadURL();
              }
              print(url);
              Get.bottomSheet(Container(
                color: Colors.white,
                height: 60,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          stopAudio();
                        },
                        child: Text("Stop")),
                    ElevatedButton(
                        onPressed: () {
                          playAudio(url);
                        },
                        child: Text("Play")),
                    ElevatedButton(
                        onPressed: () {
                          pauseAudio();
                        },
                        child: Text("Pause")),
                  ],
                ),
              ));
            },
          ),
        ],
      )),
    );
  }
}

// ElevatedButton(
//               onPressed: () async {
//                 String url;
//                 var random = new Random();
//                 int x = random.nextInt(1000);
//                 print(x);
//                 if (x == 69) {
//                   url = await storage
//                       .ref()
//                       .child('songs/devm.mp3')
//                       .getDownloadURL();
//                 } else {
//                   x = random.nextInt(9);
//                   url = await storage
//                       .ref()
//                       .child('songs/00' + x.toString() + '.mp3')
//                       .getDownloadURL();
//                 }
//                 print(url);
//                 Get.bottomSheet(Container(
//                   color: Colors.white,
//                   height: 60,
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     children: [
//                       ElevatedButton(
//                           onPressed: () {
//                             stopAudio();
//                           },
//                           child: Text("Stop")),
//                       ElevatedButton(
//                           onPressed: () {
//                             playAudio(url);
//                           },
//                           child: Text("Play")),
//                       ElevatedButton(
//                           onPressed: () {
//                             pauseAudio();
//                           },
//                           child: Text("Pause")),
//                     ],
//                   ),
//                 ));
//               },
//               child: Text("Play a random song!!"))
