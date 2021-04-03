import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:whackiest/screens/AppScreens/homepage.dart';
import 'package:whackiest/services/authService.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'login.dart';

class Register extends StatefulWidget {
  Register({Key key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
//
  @override
//
//
  AuthService _auth = AuthService();
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  String email;
  Widget _buildemail() {
    return TextFormField(
      onChanged: (String val) {
        email = val;
      },
      decoration: InputDecoration(labelText: "Email"),
      validator: (String val) {
        if (val.isEmpty) {
          return "Email is required";
        }
        return null;
      },
    );
  }

  String password;
  Widget _buildpassword() {
    return TextFormField(
      onSaved: (String val) {
        password = val;
      },
      decoration: InputDecoration(labelText: "Password"),
      validator: (String val) {
        if (val.isEmpty) {
          return "Password is required.";
        } else if (val.length < 6) {
          return "Password should be atleast 6 characters long.";
        }
        return null;
      },
    );
  }

//
//
//......using bool visibilty to show a text that veification email has been sent after clicking submit ...
//
//
  bool visibility = false;
//
//
//......using bool verified to check if email is verified or not.
//
//
  bool verified;
  Timer timer;
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        // appBar: AppBar(
        //   title: Text("Register"),
        // ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
          child: Form(
            key: _formkey,
            child: ListView(
              children: [
                SizedBox(
                  height: 20,
                ),
                CircleAvatar(
                  radius: 100,
                  backgroundImage: AssetImage("assets/logo.png"),
                ),
                Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(10),
                    child: Text(
                      'REGISTER',
                      style: TextStyle(
                          color: Colors.purpleAccent,
                          fontWeight: FontWeight.w500,
                          fontSize: 20),
                    )),
                _buildemail(),
                _buildpassword(),
                SizedBox(
                  height: 30,
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
                        'Submit',
                        style: TextStyle(color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  onTap: () async {
                    if (!_formkey.currentState.validate()) return;
                    _formkey.currentState.save();
                    // call method to signup
                    User user = await _auth.createUserWithEmailAndPAss(
                        email: email, password: password);
                    if (user != null) {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Homepage()));
                    }
                  },
                ),
                // ElevatedButton(
                //     onPressed: () async {
                // if (!_formkey.currentState.validate()) return;
                // _formkey.currentState.save();
                // // call method to signup
                // User user = await _auth.createUserWithEmailAndPAss(
                //     email: email, password: password);
                // if (user != null) {
                //   Navigator.push(
                //       context,
                //       MaterialPageRoute(
                //           builder: (context) => Homepage()));
                // }
                //     },
                //     child: Text("Submit")),
                SizedBox(
                  height: 20,
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
                          'Sign up using gmail',
                          style: TextStyle(color: Colors.white),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    onTap: () async {
                      await _auth.googleSignin().then((value) {
                        if (value.emailVerified)
                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (_) => Homepage()));
                      });
                    }),

                // ElevatedButton(
                //   onPressed: () async {
                //     await _auth.googleSignin().then((value) {
                //       if (value.emailVerified)
                //         Navigator.pushReplacement(context,
                //             MaterialPageRoute(builder: (_) => Homepage()));
                //     });
                //   },
                //   child:
                // ),

                FlatButton(
                  onPressed: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => Login()));
                  },
                  child: Text(
                    "login screen",
                    style: TextStyle(color: Colors.purpleAccent),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
