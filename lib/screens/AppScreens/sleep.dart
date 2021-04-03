import 'package:flutter/material.dart';
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
      subtitle: Text(
          'Connect your headphones and set the volume to a comfortable level.'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(height: 40),
          GestureDetector(
            child: tile("Relaxation, Stress Reduction"),
            onTap: () async {
              String url =
                  await storage.ref().child('Alpha.mp3').getDownloadURL();
              print(url);
              playAudio(url);
            },
          ),
          GestureDetector(
            child: tile("Awareness, Alertness"),
            onTap: () async {
              String url =
                  await storage.ref().child('Beta.mp3').getDownloadURL();
              print(url);
              playAudio(url);
            },
          ),
          GestureDetector(
            child: tile("REM Sleep. Power Naps"),
            onTap: () async {
              String url =
                  await storage.ref().child('Theta.mp3').getDownloadURL();
              print(url);
              playAudio(url);
            },
          ),
          GestureDetector(
            child: tile("Focus, Concentration, Information Processing"),
            onTap: () async {
              String url =
                  await storage.ref().child('Gamma.mp3').getDownloadURL();
              print(url);
              playAudio(url);
            },
          ),
          GestureDetector(
            child: tile("Deep Sleep. Recovery"),
            onTap: () async {
              String url =
                  await storage.ref().child('Delta.mp3').getDownloadURL();
              print(url);
              playAudio(url);
            },
          ),
        ],
      ),
    );
  }
}
