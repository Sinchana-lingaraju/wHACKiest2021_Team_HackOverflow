import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whackiest/screens/AppScreens/homepage.dart';
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

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Login"),
        ),
        body: Container(
          padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
          child: ListView(
            children: [
              SizedBox(
                height: 40,
              ),
              ElevatedButton(
                onPressed: () async {
                  await _auth.googleSignin().then((value) {
                    if (value.emailVerified)
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (_) => MyHomePage()));
                  });
                },
                child: Text("Sign up using google"),
              ),
              SizedBox(
                height: 150,
              ),
              TextField(
                onChanged: (val) {
                  setState(() {
                    phone = val;
                  });
                },
                decoration:
                    InputDecoration(labelText: "Phn num", prefixText: "+91"),
              ),
              SizedBox(
                height: 60,
              ),
              ElevatedButton(
                onPressed: () async {
                  await _submit().then((value) {
                    if (value != null)
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (_) => MyHomePage()));
                  });
                },
                child: Text("verify"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future _submit() async {
    final _auth = FirebaseAuth.instance;

//
//
//
//
//
//
    // this will be called when code is auto-verified only!!

    final PhoneVerificationCompleted verificationSuccess =
        (AuthCredential credential) async {
      print("Verification completed :" + credential.toString());
      UserCredential userCredential =
          await _auth.signInWithCredential(credential);
      Navigator.pop(context);
      Navigator.push(context, MaterialPageRoute(builder: (_) => MyHomePage()));
      return userCredential.user;
    };

//
//
//
    // obvio :\
    final PhoneVerificationFailed verificationFailed =
        (FirebaseAuthException exception) {
      print("Verification failed!!!!\n\n\n\n");
      showAboutDialog(context: context, children: [
        Text("Verification failed : Error :" + exception.message),
      ]);
      return null;
    };
//
//
//
//

    Future<bool> smsCodeDialog(context) {
      return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return AlertDialog(
            title: Text("Enter Code"),
            content: TextField(
              onChanged: (val) {
                smscode = val;
              },
            ),
            actions: [
              TextButton(
                child: Text("Verify"),
                onPressed: () {
                  User user = FirebaseAuth.instance.currentUser;
                  if (user != null) {
                    Navigator.pop(context);
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (_) => MyHomePage()));
                    return user;
                  } else {
                    showAboutDialog(context: context, children: [
                      Text("Some error occured. Try again!"),
                      TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text("Close"))
                    ]);
                    Navigator.pop(context);
                    signIn();
                  }
                },
              )
            ],
          );
        },
      );
    }

//
//
    // first callback to be called by verifyPhoneNumber.
    final PhoneCodeSent phoneCodeSent = (String verID, [int forceCodeResend]) {
      if (smscode == verID) this.verificationCode = verID;
      smsCodeDialog(context).then((value) => print("Signed In"));
    };

    final PhoneCodeAutoRetrievalTimeout autoRetrievalTimeout = (String verID) {
      this.verificationCode = verID;
    };

    await _auth.verifyPhoneNumber(
        phoneNumber: "+91" + this.phone,
        verificationCompleted: verificationSuccess,
        verificationFailed: verificationFailed,
        codeSent: phoneCodeSent,
        codeAutoRetrievalTimeout: autoRetrievalTimeout);
  }

  signIn() {
    AuthCredential phoneAuthCredential = PhoneAuthProvider.credential(
        verificationId: verificationCode, smsCode: smscode);
    FirebaseAuth.instance
        .signInWithCredential(phoneAuthCredential)
        .then((user) => Navigator.push(
            //Welcome(user.user.uid.toString()),
            context,
            MaterialPageRoute(builder: (_) => MyHomePage())))
        .catchError((e) => print("Error : " + e));
  }
}
