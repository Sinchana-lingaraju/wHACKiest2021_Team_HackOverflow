import 'package:flutter/material.dart';
import 'dart:math';
import 'package:audioplayers/audioplayers.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/route_manager.dart';

class Music extends StatefulWidget {
  Music({Key key}) : super(key: key);

  @override
  _MusicState createState() => _MusicState();
}

class _MusicState extends State<Music> with SingleTickerProviderStateMixin {
  // AnimationController _controller;
  // Animation _animation;
  // initState() {
  //   super.initState();

  //   _controller = AnimationController(
  //     duration: Duration(seconds: 2),
  //     vsync: this,
  //   );
  //   _animation = Tween(begin: 0.0, end: 1.0).animate(_controller);

  //   _controller.forward();
  // }

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
  // dispose() {
  //   _controller.dispose();
  //   super.dispose();
  // }

  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image(
                image: NetworkImage(
                    "https://4.bp.blogspot.com/-mVJvYwZkyGM/Xl_A_P5vyEI/AAAAAAAz9rU/5XwX4xRwZrwbLM9mLaxl-I7QRL1hv42dQCLcBGAsYHQ/s1600/AW4207455_15.gif")),
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
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton.extended(
            onPressed: () async {
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
            icon: Icon(
              Icons.music_note,
              color: Colors.white,
            ),
            backgroundColor: Colors.purpleAccent,
            label: Text("Play a random song")),
      ),
    );
  }
}
