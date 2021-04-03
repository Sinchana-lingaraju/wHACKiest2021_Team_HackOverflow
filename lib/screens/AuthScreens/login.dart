import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:whackiest/screens/AppScreens/homepage.dart';
import 'package:whackiest/screens/AuthScreens/resgister.dart';
//import 'package:whackiest/screens/AuthScreens/register.dart';
import 'package:whackiest/services/authService.dart';

class Login extends StatefulWidget {
  Login({Key key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  AuthService _auth = AuthService();
  String phone;
  String smscode;
  String verificationCode;
  bool codesent = false;

  String email;
  String password;
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
            padding: EdgeInsets.all(10),
            child: ListView(
              children: <Widget>[
                SizedBox(
                  height: 40,
                ),
                Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(10),
                    child: Text(
                      'HackOverflow',
                      style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.w500,
                          fontSize: 30),
                    )),
                Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(10),
                    child: Text(
                      'Log in. Breathe.',
                      style: TextStyle(fontSize: 20),
                    )),
                Container(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    controller: nameController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Email',
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: TextField(
                    obscureText: true,
                    controller: passwordController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                    ),
                  ),
                ),
                SizedBox(
                  height: 30.0,
                ),
                Container(
                    height: 50,
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: ElevatedButton(
                      // textColor: Colors.white,
                      // color: Colors.blue,
                      child: Text('Login'),
                      onPressed: () async {
                        print(nameController.text);
                        print(passwordController.text);
                        User user = await AuthService().signInWithEmail(
                            email: nameController.text,
                            password: passwordController.text);
                        if (user != null)
                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (_) => Homepage()));
                      },
                    )),
                Container(
                    child: Row(
                  children: <Widget>[
                    Text('New user?'),
                    TextButton(
                      child: Text(
                        'Sign up',
                        style: TextStyle(fontSize: 17),
                      ),
                      onPressed: () {
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (_) => Register()));
                      },
                    )
                  ],
                  mainAxisAlignment: MainAxisAlignment.center,
                ))
              ],
            )));
  }
}
