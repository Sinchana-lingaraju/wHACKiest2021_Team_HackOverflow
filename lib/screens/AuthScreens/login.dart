import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:whackiest/screens/AppScreens/homepage.dart';
import 'package:whackiest/screens/AppScreens/introduction%20.dart';
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
                  height: 20,
                ),
                CircleAvatar(
                  radius: 90,
                  backgroundImage: AssetImage("assets/logo.png"),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(10),
                    child: Text(
                      'HackOverflow',
                      style: TextStyle(
                          color: Colors.purpleAccent,
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
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                    decoration: InputDecoration(
                        labelText: 'Email',
                        labelStyle: TextStyle(color: Colors.purpleAccent),
                        prefixIcon: Icon(
                          Icons.person,
                          color: Colors.purpleAccent,
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50.0))),
                    validator: (val) => val.isEmpty ? 'Enter an Email' : null,
                    onChanged: (val) {
                      setState(() => email = val);
                    }),
                SizedBox(
                  height: 20.0,
                ),
                TextFormField(
                    decoration: InputDecoration(
                        labelText: 'Password',
                        labelStyle: TextStyle(color: Colors.purpleAccent),
                        prefixIcon: Icon(
                          Icons.visibility_off,
                          color: Colors.purpleAccent,
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50.0))),
                    validator: (val) => val.isEmpty ? 'Enter Password' : null,
                    onChanged: (val) {
                      setState(() => email = val);
                    }),
                SizedBox(
                  height: 20.0,
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
                        'Login',
                        style: TextStyle(color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  onTap: () async {
                    print(nameController.text);
                    print(passwordController.text);
                    User user = await AuthService().signInWithEmail(
                        email: nameController.text,
                        password: passwordController.text);
                    if (user != null)
                      Navigator.pushReplacement(
                          context, MaterialPageRoute(builder: (_) => intro()));
                  },
                ),
                // Container(
                //     height: 50,
                //     //  color: Colors.purpleAccent,
                //     padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                //     child: ElevatedButton(
                //       child: Text('Login'),
                // onPressed: () async {
                //   print(nameController.text);
                //   print(passwordController.text);
                //   User user = await AuthService().signInWithEmail(
                //       email: nameController.text,
                //       password: passwordController.text);
                //   if (user != null)
                //     Navigator.pushReplacement(context,
                //         MaterialPageRoute(builder: (_) => Homepage()));
                // },
                //     )),
                Container(
                    child: Row(
                  children: <Widget>[
                    Text('New user?'),
                    TextButton(
                      child: Text(
                        'Sign up',
                        style:
                            TextStyle(fontSize: 15, color: Colors.purpleAccent),
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
