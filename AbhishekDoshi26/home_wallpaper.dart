import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:wallpaper/constants.dart';
import 'package:flutter_page_transition/flutter_page_transition.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:wallpaper/show.dart';

String data;

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<String> url = List();
  bool done = false;

  Future getImages() async {
    setState(() {
      url = List();
      done = false;
    });
    for (int i = 0; i < 16; i++) {
      String requestURL =
          "http://www.splashbase.co/api/v1/images/random/?images_only=true";
      http.Response response = await http.get(requestURL);
      if (response.statusCode == 200) {
        var decodedData = jsonDecode(response.body);
        if (decodedData['large_url'] != null ||
            decodedData['large_url'].toString().endsWith('.jpg') ||
            decodedData['large_url'].toString().endsWith('.png') ||
            decodedData['large_url'].toString().endsWith('.jpeg'))
          url.add(decodedData['large_url']);
      } else {
        print(response.statusCode);
        throw 'Problem with the get request';
      }
    }
    setState(() {
      done = true;
    });
  }

  void fetch() {
    getImages();
  }

  @override
  void initState() {
    super.initState();
    fetch();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final double itemHeight = (size.height - kToolbarHeight - 24) / 2;
    final double itemWidth = size.width / 2;

    return SafeArea(
      child: Scaffold(
        backgroundColor: kBackground,
        body: LiquidPullToRefresh(
          color: Colors.black45,
          showChildOpacityTransition: false,
          onRefresh: () => getImages(),
          child: ScrollConfiguration(
            behavior: new ScrollBehavior()
              ..buildViewportChrome(context, null, AxisDirection.down),
            child: GridView.count(
              crossAxisCount: 2,
              childAspectRatio: itemWidth / itemHeight,
              mainAxisSpacing: 10.0,
              crossAxisSpacing: 10.0,
              children:
                  List.generate(url.length == 0 ? 16 : url.length, (index) {
                return Card(
                  color: Colors.grey.shade700,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(20.0),
                    ),
                  ),
                  shadowColor: Colors.grey,
                  elevation: 20.0,
                  child: done == false
                      ? Center(child: CircularProgressIndicator())
                      : ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                data = url[index];
                              });
                              Navigator.of(context).push(
                                PageTransition(
                                  type: PageTransitionType.slideInUp,
                                  duration: Duration(milliseconds: 300),
                                  child: Help(),
                                ),
                              );
                            },
                            child: CachedNetworkImage(
                              imageUrl: url[index],
                              fit: BoxFit.cover,
                              placeholder: (context, url) {
                                return Center(
                                  child: CircularProgressIndicator(),
                                );
                              },
                              errorWidget: (context, url, error) => Icon(
                                Icons.error,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                );
              }),
            ),
          ),
        ),
      ),
    );
  }
}
