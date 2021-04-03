import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class Log extends StatefulWidget {
  Log({Key key}) : super(key: key);

  @override
  _LogState createState() => _LogState();
}

class _LogState extends State<Log> {
  int _currentMood;
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              child: Text(
                  "Hello " + FirebaseAuth.instance.currentUser.displayName),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add_box),
          onPressed: () {
            Get.bottomSheet(SingleChildScrollView(
              child: Container(
                color: Colors.white,
                child: Column(
                  children: [
                    Text("Title: "),
                    TextField(),
                    Text("Content: "),
                    TextField(),
                    Text("How's you feelin!!"),
                    SfSlider(
                      min: 0.0,
                      max: 100.0,
                      value: 100.0,
                      interval: 20,
                      showTicks: true,
                      showLabels: true,
                      enableTooltip: true,
                      minorTicksPerInterval: 1,
                      onChanged: (dynamic value) {
                        setState(() {
                          _currentMood = value;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ));
          },
        ),
      ),
    );
  }
}
