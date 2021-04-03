import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class NewsData {
  String author;
  String title;
  String description;
  String url;
  String urlImage;
  String content;
  NewsData(this.author, this.title, this.description, this.url, this.urlImage,
      this.content);
}

class News extends StatefulWidget {
  News({Key key}) : super(key: key);

  @override
  _NewsState createState() => _NewsState();
}

class _NewsState extends State<News> {
  Uri uri = Uri.parse(
      "https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=388bd2d9fbe34a838456ec57cf06a9fd");

  Future _newsItems() async {
    List<NewsData> newsData = [];
    var data = await http.get(uri);
    // print(data.body);
    var jsonData = json.decode(data.body);
    //print(jsonData["Countries"]);
    var finaljsondata = jsonData["articles"];
    print(finaljsondata);
    for (var y in finaljsondata) {
      NewsData news = NewsData(y['author'], y['title'], y['description'],
          y['url'], y['urlToImage'], y['content']);
      print(news.urlImage);
      newsData.add(news);
    }
    return newsData;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder(
        future: _newsItems(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return Container(
              child: ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                      height: 400,
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(20)),
                      margin: EdgeInsets.symmetric(vertical: 4, horizontal: 6),
                      child: Column(
                        children: [
                          // NetworkImage(snapshot.data[index].urlImage),
                          Text(
                            snapshot.data[index].author,
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ));
                },
              ),
            );
          } else {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(),
                  SizedBox(
                    height: 50,
                  ),
                  Text(
                    "Fetching data...",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      // shadows: [
                      //   Shadow(
                      //       color: Colors.black,
                      //       blurRadius: 20,
                      //       offset: Offset(5, 10))
                      // ],
                    ),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
