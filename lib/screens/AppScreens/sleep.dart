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

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(height: 10),
            GestureDetector(
              child: ListTile(
                title: Text("Relaxation, Stress Reduction"),
                leading: CircleAvatar(
                  backgroundImage: ExactAssetImage('assets/alpha.png'),
                  radius: 20,
                ),
              ),
              onTap: () async {
                String url =
                    await storage.ref().child('Alpha.mp3').getDownloadURL();
                print(url);
                playAudio(url);
                Get.bottomSheet(Container(
                    height: 300,
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
                        Padding(
                          padding: const EdgeInsets.all(30.0),
                          child: Text(
                              "Alpha beats(8-12Hz) will slow down your mind and slowly put you into a relaxed, loosened state.Connect your headphones and set the volume to a comfortable level."),
                        ),
                        CircleAvatar(
                          backgroundImage: ExactAssetImage('assets/alpha.png'),
                          radius: 50,
                        ),
                      ],
                    )));
              },
            ),
            Divider(),
            SizedBox(
              height: 20,
            ),
            GestureDetector(
              child: ListTile(
                  title: Text("Awareness, Alertness"),
                  leading: CircleAvatar(
                    backgroundImage: ExactAssetImage('assets/beta.png'),
                    radius: 20,
                  )),
              onTap: () async {
                String url =
                    await storage.ref().child('Beta.mp3').getDownloadURL();
                print(url);
                playAudio(url);
                Get.bottomSheet(Container(
                    height: 300,
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
                        Padding(
                          padding: const EdgeInsets.all(30.0),
                          child: Text(
                              "Beta beats (14-30Hz) helps increase situational awareness, alertness, and overall happiness and well-being.Connect your headphones and set the volume to a comfortable level."),
                        ),
                        CircleAvatar(
                          backgroundImage: ExactAssetImage('assets/beta.png'),
                          radius: 50,
                        )
                      ],
                    )));
              },
            ),
            Divider(),
            SizedBox(
              height: 20,
            ),
            GestureDetector(
              child: ListTile(
                title: Text("REM Sleep. Power Naps"),
                leading: CircleAvatar(
                  backgroundImage: ExactAssetImage(
                    'assets/theta.png',
                  ),
                  radius: 20,
                ),
              ),
              onTap: () async {
                String url =
                    await storage.ref().child('Theta.mp3').getDownloadURL();
                print(url);
                playAudio(url);
                Get.bottomSheet(Container(
                    height: 300,
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
                        Padding(
                          padding: const EdgeInsets.all(30.0),
                          child: Text(
                              "Theta beats(4.8Hz) are suitable for power naps, as they trigger REM sleep.Connect your headphones and set the volume to a comfortable level."),
                        ),
                        CircleAvatar(
                          backgroundImage: ExactAssetImage(
                            'assets/theta.png',
                          ),
                          radius: 50,
                        ),
                      ],
                    )));
              },
            ),
            Divider(),
            SizedBox(
              height: 20,
            ),
            GestureDetector(
              child: ListTile(
                title: Text("Focus, Concentration, Information Processing"),
                leading: CircleAvatar(
                  radius: 20,
                  backgroundImage: ExactAssetImage('assets/gamma.png'),
                ),
              ),
              onTap: () async {
                String url =
                    await storage.ref().child('Gamma.mp3').getDownloadURL();
                print(url);
                playAudio(url);
                Get.bottomSheet(Container(
                    height: 300,
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
                        Padding(
                          padding: const EdgeInsets.all(30.0),
                          child: Text(
                              "Gamma beats (30-70Hz) are good for focus, concentration, and high level information processing.Connect your headphones and set the volume to a comfortable level."),
                        ),
                        CircleAvatar(
                          radius: 50,
                          backgroundImage: ExactAssetImage('assets/gamma.png'),
                        ),
                      ],
                    )));
              },
            ),
            Divider(),
            SizedBox(
              height: 20,
            ),
            GestureDetector(
              child: ListTile(
                title: Text("Deep Sleep. Recovery"),
                leading: CircleAvatar(
                  backgroundImage: ExactAssetImage('assets/delta.png'),
                  radius: 20,
                ),
              ),
              onTap: () async {
                String url =
                    await storage.ref().child('Delta.mp3').getDownloadURL();
                print(url);
                playAudio(url);
                Get.bottomSheet(Container(
                    height: 300,
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
                        Padding(
                          padding: const EdgeInsets.all(30.0),
                          child: Text(
                              "Delta beats(0.1-4Hz) will lull you into a deep, comfortable sleep, and are good for healing.Connect your headphones and set the volume to a comfortable level."),
                        ),
                        CircleAvatar(
                          backgroundImage: ExactAssetImage('assets/delta.png'),
                          radius: 50,
                        ),
                      ],
                    )));
              },
            ),
            Divider(),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
