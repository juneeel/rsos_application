import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Article.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import "package:package_info/package_info.dart";

class NewsPage extends StatefulWidget {
  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  var cName;
  var country;
  var catagory;
  var findNews;
  int pageNum = 1;
  bool isPageLoading = false;
  late ScrollController controller;
  int pageSize = 10;
  bool isSwitched = false;
  List news = [];
  bool notFound = false;
  List<int> data = [];
  bool isLoading = false;
  String baseApi = "https://newsapi.org/v2/top-headlines?";

  @override
  void initState() {
    controller = new ScrollController()..addListener(_scrollListener);
    getNews();
    super.initState();
  }

  _scrollListener() {
    if (controller.position.pixels == controller.position.maxScrollExtent) {
      setState(() {
        isLoading = true;
      });
      getNews();
    }
  }

  getDataFromApi(url) async {
    http.Response res = await http.get(Uri.parse(url));
    if (res.statusCode == 200) {
      if (jsonDecode(res.body)['totalResults'] == 0) {
        notFound = isLoading ?false :true;
        setState(() {

          isLoading = false;
        });
      } else {
        if (isLoading) {
          List newData = jsonDecode(res.body)['articles'];
          newData.forEach((e) {
            news.add(e);
          });
        } else {
          news = jsonDecode(res.body)['articles'];
        }
        setState(() {
          notFound = false;
          isLoading = false;
        });
      }
    } else {
      setState(() => notFound = true);
    }
  }

  getNews({channel, searchKey, reload = false}) async {
    setState(() => notFound = false);

    if (!reload && !isLoading) {

    } else {
      country = null;
      catagory = null;
    }
    if (isLoading) {
      pageNum++;
    } else {
      setState(() {
        news = [];
      });
      pageNum = 1;
    }
    baseApi = "https://newsapi.org/v2/top-headlines?pageSize=10&page=$pageNum&";

    baseApi += country == null ? 'country=ph&' : 'country=$country&';
    baseApi += catagory == null ? '' : 'category=$catagory&';
    baseApi += 'apiKey=ccee13ddd92842ba878ba0282a0c1ca4';
    if (channel != null) {
      country = null;
      catagory = null;
      baseApi =
      "https://newsapi.org/v2/top-headlines?country=ph&apiKey=ccee13ddd92842ba878ba0282a0c1ca4";
    }
    if (searchKey != null) {
      country = null;
      catagory = null;
      baseApi =
      "https://newsapi.org/v2/top-headlines?country=ph&apiKey=ccee13ddd92842ba878ba0282a0c1ca4";
    }
    print(baseApi);
    getDataFromApi(baseApi);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child:  Scaffold(
          backgroundColor: Color(0xff14213d),
          drawer: ListView(
          padding: EdgeInsets.symmetric(vertical: 60),
          children: <Widget>[
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  country != null ? Text("Country = $cName") : Container(),
                  SizedBox(height: 10),
                  catagory != null
                      ? Text("Catagory = $catagory")
                      : Container(),
                  SizedBox(height: 20),
                ],
              ),
            ),
            Container(
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(left: 5),
                      // child: TextFormField(
                      //   decoration: InputDecoration(hintText: "Find Keyword"),
                      //   scrollPadding: EdgeInsets.all(5),
                      //   onChanged: (val) => setState(() => findNews = val),
                      // ),
                    ),
                  ),
                  // MaterialButton(
                  //   child: Text("Find"),
                  //   onPressed: () async {
                  //     getNews(searchKey: findNews);
                  //   },
                  // ),
                ],
              ),
            ),
            // ExpansionTile(
            //   title: Text("Country"),
            //   children: <Widget>[
            //     for (int i = 0; i < listOfCountry.length; i++)
            //       DropDownList(
            //         call: () {
            //           country = listOfCountry[i]['code'];
            //           cName = listOfCountry[i]['name']!.toUpperCase();
            //           getNews();
            //         },
            //         name: listOfCountry[i]['name']!.toUpperCase(),
            //       ),
            //   ],
            // ),
            // ExpansionTile(
            //   title: Text("Catagory"),
            //   children: [
            //     for (int i = 0; i < listOfCatagory.length; i++)
            //       DropDownList(
            //           call: () {
            //             catagory = listOfCatagory[i]['code'];
            //             getNews();
            //           },
            //           name: listOfCatagory[i]['name']!.toUpperCase())
            //   ],
            // ),
            // ExpansionTile(
            //   title: Text("Channel"),
            //   children: [
            //     for (int i = 0; i < listOfNewsChannel.length; i++)
            //       DropDownList(
            //         call: () {
            //           getNews(channel: listOfNewsChannel[i]['code']);
            //         },
            //         name: listOfNewsChannel[i]['name']!.toUpperCase(),
            //       ),
            //   ],
            // ),
            // ListTile(
            //   title: Text("Exit"),
            //   onTap: () => exit(0),
            // ),
          ],
        ),
        // appBar: AppBar(
        //   centerTitle: true,
        //   title: Text("News"),
        //   actions: [
        //     IconButton(
        //       onPressed: () {
        //         country = null;
        //         catagory = null;
        //         findNews = null;
        //         cName = null;
        //         getNews(reload: true);
        //       },
        //       icon: Icon(Icons.refresh),
        //     ),
        //     Switch(
        //       value: isSwitched,
        //       onChanged: (value) => setState(() => isSwitched = value),
        //       activeTrackColor: Colors.yellow,
        //       activeColor: Colors.red,
        //     ),
        //   ],
        // ),
        body: notFound
            ? Center(
          child: Text(
            "Not Found",
            style: TextStyle(fontSize: 30),
          ),
        )
            : news.length == 0
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
          controller: controller,
          itemBuilder: (context, index) {
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(5),
                  child: Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    child: GestureDetector(
                      onTap: () async {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                ArticalNews(newsUrl: news[index]['url']),
                          ),
                        );
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            vertical: 10, horizontal: 15),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30)),
                        child: Column(
                          children: [
                            Stack(children: [
                              news[index]['urlToImage'] == null
                                  ? Container()
                                  : ClipRRect(
                                borderRadius:
                                BorderRadius.circular(20),
                                child: CachedNetworkImage(
                                  placeholder: (context, url) =>
                                      Container(
                                          child:
                                          CircularProgressIndicator()),
                                  errorWidget:
                                      (context, url, error) =>
                                      Icon(Icons.error),
                                  imageUrl: news[index]
                                  ['urlToImage'],
                                ),
                              ),
                              Positioned(
                                bottom: 10,
                                right: 20,
                                child: Text(
                                  "${news[index]['source']['name']}",
                                  style: TextStyle(color: Colors.red),
                                ),
                              ),
                            ]),
                            Divider(),
                            Text(
                              "${news[index]['title']}",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                index==news.length-1 && isLoading?Center(child: CircularProgressIndicator()):SizedBox(),
              ],
            );
          },
          itemCount: news.length,
        ),
      ),
    );
  }
}

class DropDownList extends StatelessWidget {
  final String name;
  final Function call;

  const DropDownList({required this.name, required this.call});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: ListTile(title: Text(name)),
      onTap: () => call(),
    );
  }
}