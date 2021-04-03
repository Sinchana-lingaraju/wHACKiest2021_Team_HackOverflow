import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:sqflite/sqflite.dart';
import 'package:provider/provider.dart';
import 'package:charts_flutter/flutter.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:path_provider/path_provider.dart';
import 'package:whackiest/models/moodcard.dart';
import 'package:whackiest/screens/DiaryScreens/chart.dart';
import 'package:whackiest/screens/DiaryScreens/homepage.dart';
import 'package:whackiest/screens/DiaryScreens/start.dart';

class Log extends StatefulWidget {
  Log({Key key}) : super(key: key);

  @override
  _LogState createState() => _LogState();
}

class _LogState extends State<Log> {
  int _currentMood;
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
        value: MoodCard(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: StartPage(),
          routes: {
            '/home_screen': (ctx) => HomeScreen(),
            '/chart': (ctx) => MoodChart(),
          },
        ));
  }
}
