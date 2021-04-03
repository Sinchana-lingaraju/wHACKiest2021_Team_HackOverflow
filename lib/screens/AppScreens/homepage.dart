import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:jumping_bottom_nav_bar/jumping_bottom_nav_bar.dart';
import 'package:whackiest/screens/AppScreens/about.dart';
import 'package:whackiest/screens/AppScreens/covid.dart';
import 'package:whackiest/screens/AppScreens/introduction%20.dart';
import 'package:whackiest/screens/AppScreens/log.dart';
import 'package:whackiest/screens/AppScreens/music.dart';
import 'package:whackiest/screens/AppScreens/news.dart';

import 'package:whackiest/screens/AppScreens/sleep.dart';
import 'package:whackiest/screens/AppScreens/volunteer.dart';
import 'package:whackiest/screens/AuthScreens/login.dart';
import 'package:whackiest/screens/DiaryScreens/chart.dart';
import 'package:whackiest/services/authService.dart';

class Homepage extends StatefulWidget {
  Homepage({Key key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int selectedIndex = 3;

  void onChangeTab(int index) {
    selectedIndex = index;
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          title: Text(""),
          backgroundColor: Colors.purpleAccent,
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage("assets/logo.png"),
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
              ),
              // ListTile(
              //   title: Text('PROGRESS'),
              //   onTap: () => Navigator.of(context).pushNamed('/chart'),
              // ),
              // Divider(
              //   thickness: 1,
              //   color: Colors.grey,
              // ),

              ListTile(
                  title: Text('VOLUNTEER'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ChatPage()),
                    );
                  }),
              Divider(
                thickness: 1,
                color: Colors.grey,
              ),
              ListTile(
                  title: Text('HELP'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => intro()),
                    );
                  }),
              Divider(
                thickness: 1,
                color: Colors.grey,
              ),
              ListTile(
                  title: Text('ABOUT'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => About()),
                    );
                  }),
              Divider(
                thickness: 1,
                color: Colors.grey,
              ),
              ListTile(
                  title: Text('LOG OUT'),
                  onTap: () async {
                    User user = await AuthService().signOut();
                    if (user == null)
                      Navigator.pushReplacement(
                          context, MaterialPageRoute(builder: (_) => Login()));
                  }),
              Divider(
                thickness: 1,
                color: Colors.grey,
              ),
            ],
          ),
        ),
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
              iconData: Icons.bedtime_sharp,
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
