import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:url_launcher/url_launcher.dart';

//
/*class DevInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return
    Padding(
      padding: const EdgeInsets.only(top: 30.0),
      child: Container(
        child: new Stack(
          children: <Widget>[
            Card(
              elevation: 5.0,
              child: Container(
                height: 150.0,
              ),
            ),
            FractionalTranslation(
              translation: Offset(0.0, -0.2), //Higher magnitude = Higher picture
              child: Align(
                child: CircleAvatar(
                  radius: 35.0,
                  child: Text("A"), //This should be the profile picture
                ),
                alignment: FractionalOffset(0.5, 0.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}*/
const _sinchanagit = 'https://github.com/Sinchana-lingaraju';
const _sinchanalink = 'https://www.linkedin.com/in/sinchana-lingaraju/';
const _yashgit = 'https://github.com/16o1kym';
const _yashlink = 'https://www.linkedin.com/in/16o1kym77/';
const _ishangit = 'https://github.com/Ishan-Dubey';
const _ishanlink = 'https://www.linkedin.com/in/ishan-dubey-4480a2194/';
void _launchSG() async => await canLaunch(_sinchanagit)
    ? await launch(_sinchanagit)
    : throw 'Could not launch $_sinchanagit';
void _launchSL() async => await canLaunch(_sinchanalink)
    ? await launch(_sinchanalink)
    : throw 'Could not launch $_sinchanalink';
void _launchYG() async => await canLaunch(_yashgit)
    ? await launch(_yashgit)
    : throw 'Could not launch $_yashgit';
void _launchYL() async => await canLaunch(_yashlink)
    ? await launch(_yashlink)
    : throw 'Could not launch $_yashlink';
void _launchIG() async => await canLaunch(_ishangit)
    ? await launch(_ishangit)
    : throw 'Could not launch $_ishangit';
void _launchIL() async => await canLaunch(_ishanlink)
    ? await launch(_ishanlink)
    : throw 'Could not launch $_ishanlink';

class About extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.purple,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Developers'),
          backgroundColor: Colors.purpleAccent,
        ),
        body: ListView(
          padding: const EdgeInsets.all(8),
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 30.0),
              child: Container(
                child: new Stack(
                  children: <Widget>[
                    Card(
                      elevation: 5.0,
                      child: Container(
                        height: 150.0,
                        child: Column(
                          children: <Widget>[
                            Column(children: <Widget>[
                              SizedBox(
                                height: 70.0,
                              ),
                              Align(
                                alignment: Alignment.center,
                                child: Text(
                                  'Sinchana Lingaraju, CSE',
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ]),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Align(
                                  alignment: Alignment.bottomRight,
                                  child: OutlinedButton(
                                    child: Text('Github'),
                                    onPressed: () {
                                      _launchSG();
                                    },
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.bottomRight,
                                  child: OutlinedButton(
                                    child: Text('LinkedIn'),
                                    onPressed: () {
                                      _launchSL();
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    FractionalTranslation(
                      translation:
                          Offset(0.0, -0.3), //Higher magnitude = Higher picture
                      child: Align(
                        child: CircleAvatar(
                          radius: 40.0,
                          backgroundImage:
                              ExactAssetImage('assets/sinchana.jpeg'),
                        ),
                        alignment: FractionalOffset(0.5, 0.0),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Divider(
              height: 20,
              thickness: 5,
              indent: 20,
              endIndent: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30.0),
              child: Container(
                child: new Stack(
                  children: <Widget>[
                    Card(
                      elevation: 5.0,
                      child: Container(
                        height: 150.0,
                        child: Column(
                          children: <Widget>[
                            Column(children: <Widget>[
                              SizedBox(
                                height: 70.0,
                              ),
                              Align(
                                alignment: Alignment.center,
                                child: Text(
                                  'Sushant Tripathi, CSE',
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ]),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Align(
                                  alignment: Alignment.bottomRight,
                                  child: OutlinedButton(
                                    child: Text('Github'),
                                    onPressed: () {
                                      _launchYG();
                                    },
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.bottomRight,
                                  child: OutlinedButton(
                                    child: Text('LinkedIn'),
                                    onPressed: () {
                                      _launchYL();
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    FractionalTranslation(
                      translation:
                          Offset(0.0, -0.3), //Higher magnitude = Higher picture
                      child: Align(
                        child: CircleAvatar(
                          radius: 40.0,
                          backgroundImage: ExactAssetImage('assets/yash.jpeg'),
                        ),
                        alignment: FractionalOffset(0.5, 0.0),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Divider(
              height: 20,
              thickness: 5,
              indent: 20,
              endIndent: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30.0),
              child: Container(
                child: new Stack(
                  children: <Widget>[
                    Card(
                      elevation: 5.0,
                      child: Container(
                        height: 150.0,
                        child: Column(
                          children: <Widget>[
                            Column(children: <Widget>[
                              SizedBox(
                                height: 70.0,
                              ),
                              Align(
                                alignment: Alignment.center,
                                child: Text(
                                  'Ishan Dubey, CSE',
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ]),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Align(
                                  alignment: Alignment.bottomRight,
                                  child: OutlinedButton(
                                    child: Text('Github'),
                                    onPressed: () {
                                      _launchIG();
                                    },
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.bottomRight,
                                  child: OutlinedButton(
                                    child: Text('LinkedIn'),
                                    onPressed: () {
                                      _launchIL();
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    FractionalTranslation(
                      translation:
                          Offset(0.0, -0.3), //Higher magnitude = Higher picture
                      child: Align(
                        child: CircleAvatar(
                          radius: 40.0,
                          backgroundImage: ExactAssetImage('assets/ishan.jpg'),
                        ),
                        alignment: FractionalOffset(0.5, 0.0),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Divider(
              height: 20,
              thickness: 5,
              indent: 20,
              endIndent: 20,
            ),
          ],
        ),
      ),
    );
  }
}
