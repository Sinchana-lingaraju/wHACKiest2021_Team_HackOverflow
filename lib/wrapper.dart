import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:whackiest/screens/AppScreens/homepage.dart';
import 'package:whackiest/screens/AppScreens/introduction%20.dart';

import 'package:whackiest/screens/AuthScreens/login.dart';

class Wrapper extends StatefulWidget {
  Wrapper({Key key}) : super(key: key);

  @override
  _WrapperState createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  @override
  Widget build(BuildContext context) {
    User user = Provider.of(context);
    // if (user == null)
    //   return Login();
    // else {
    return intro();
  }
}
