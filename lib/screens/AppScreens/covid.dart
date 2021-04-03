import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'dart:math';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:maps_launcher/maps_launcher.dart';

class CovidData {
  String region;
  String recovered;
  String recoveredToday;
  CovidData(this.region, this.recovered, this.recoveredToday);
}

class Covid extends StatelessWidget {
  // const Covid({Key key}) : super(key: key);
  bool show = true;
  Uri uri = Uri.parse(
      "https://api.apify.com/v2/key-value-stores/toDWvRj1JpTXiM8FF/records/LATEST?disableRedirect=true");
  Future _covidData() async {
    List<CovidData> li;
    var data = await http.get(uri);
    // print(data.body);
    var jsonData = json.decode(data.body);
    print(jsonData['regionData']);
    var finaljsondata = jsonData['regionData'];
    for (var y in finaljsondata) {
      CovidData covidData =
          CovidData(y['region'], y['recovered'], y['newRecovered']);
      print(y['region']);
      li.add(covidData);
    }
    return li;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image(
            image: NetworkImage(
                'https://media1.tenor.com/images/4b5e8155eb7d8397b26b0d156c39898c/tenor.gif?itemid=4145835')),
        Padding(
          padding: const EdgeInsets.all(40.0),
          child: Text(
            "We know that these are tough times, but we will get through it together",
            textAlign: TextAlign.center,
          ),
        ),
        // FutureBuilder(
        //   future: _covidData(),
        //   builder: (BuildContext context, AsyncSnapshot snapshot) {
        //     if (snapshot.hasData) {
        //       return Container(
        //         child: ListView.builder(
        //           itemCount: snapshot.data.length,
        //           itemBuilder: (BuildContext context, int index) {
        //             return Container(
        //                 height: 200,
        //                 decoration: BoxDecoration(
        //                     color: Colors.black,
        //                     borderRadius: BorderRadius.circular(20)),
        //                 margin:
        //                     EdgeInsets.symmetric(vertical: 4, horizontal: 6),
        //                 child: Column(
        //                   children: [
        //                     // NetworkImage(snapshot.data[index].urlImage),
        //                     Text(
        //                       snapshot.data[index].recovered,
        //                       style: TextStyle(color: Colors.white),
        //                     ),
        //                   ],
        //                 ));
        //           },
        //         ),
        //       );
        //     } else {
        //       return Center(
        //         child: CircularProgressIndicator(),
        //       );
        //     }
        //   },
        // ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(
            "COVID 19 VACINATION CENTERS",
            style: TextStyle(
                color: Colors.purpleAccent,
                fontWeight: FontWeight.w500,
                fontSize: 20),
            textAlign: TextAlign.center,
          ),
        ),
        FloatingActionButton(
          backgroundColor: Colors.white,
          onPressed: () {
            MapsLauncher.launchQuery('Covid 19 Vaccine');
          },
          child: Icon(
            Icons.location_on,
            color: Colors.purpleAccent,
          ),
        ),
      ],
    );
  }
}
