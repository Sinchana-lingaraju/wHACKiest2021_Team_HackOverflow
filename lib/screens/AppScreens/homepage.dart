import 'package:flutter/material.dart';
import 'package:jumping_bottom_nav_bar/jumping_bottom_nav_bar.dart';
import 'package:whackiest/screens/AppScreens/covid.dart';
import 'package:whackiest/screens/AppScreens/log.dart';
import 'package:whackiest/screens/AppScreens/music.dart';
import 'package:whackiest/screens/AppScreens/news.dart';
import 'package:whackiest/screens/AppScreens/sleep.dart';
//import 'package:kf_drawer/kf_drawer.dart';

//import 'package:flurry_navigation/flurry_navigation.dart';

class Homepage extends StatefulWidget {
  Homepage({Key key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int selectedIndex = 1;

  void onChangeTab(int index) {
    selectedIndex = index;
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        body: TabBarView(
          children: [
            new Container(
              child: Sleep(),
            ),
            new Container(
              child: Log(),
            ),
            new Container(
              child: News(),
            ),
            new Container(
              child: Covid(),
            ),
            new Container(
              child: Music(),
            ),
          ],
        ),
        bottomNavigationBar: JumpingTabBar(
          onChangeTab: onChangeTab,
          backgroundColor: Colors.purpleAccent,
          circleGradient: LinearGradient(
            colors: [
              Colors.purpleAccent,
              Colors.deepPurple,
            ],
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
          ),
          items: [
            TabItemIcon(
              iconData: Icons.arrow_back,
              curveColor: Colors.white,
            ),
            TabItemIcon(iconData: Icons.book, curveColor: Colors.white),
            TabItemIcon(iconData: Icons.topic, curveColor: Colors.white),
            TabItemIcon(iconData: Icons.coronavirus, curveColor: Colors.white),
            TabItemIcon(iconData: Icons.music_note, curveColor: Colors.white),
          ],
          selectedIndex: selectedIndex,
        ),
      ),
    );
  }
}
