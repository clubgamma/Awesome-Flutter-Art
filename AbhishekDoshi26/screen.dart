import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_page_transition/flutter_page_transition.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shopping_ui/show.dart';

bool isSelected = false;

class Screen extends StatefulWidget {
  @override
  _ScreenState createState() => _ScreenState();
}

class _ScreenState extends State<Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Color(0xff1e2122),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Icon(
          FontAwesomeIcons.apple,
          size: 35.0,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 10.0,
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: GestureDetector(
                  onTap: () => Navigator.of(context).push(
                    PageTransition(
                      type: PageTransitionType.slideInLeft,
                      duration: Duration(milliseconds: 500),
                      child: Help(),
                    ),
                  ),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(20.0),
                      ),
                    ),
                    elevation: 30.0,
                    color: Color(0xff292e30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Hero(
                          tag: 'image',
                          child: Image.asset(
                            'images/airpods_complete.png',
                            height: 300.0,
                            width: 300.0,
                          ),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 25.0),
                          child: Text(
                            "Airpods 1st Generation",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 25.0,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 25.0),
                          child: Text(
                            "Rs. 18,900 /-",
                            style: TextStyle(
                              color: Colors.white60,
                              fontSize: 18.0,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 25.0),
                          child: Text(
                            "Active Noise Cancellation. You'll feel your\nmusic, not your headphones",
                            style: TextStyle(
                              color: Color(0xff747475),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 40.0,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(left: 25.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "These internally tapered\ntips conform to your ear\nshape, keeping AirPods\npro secure. ",
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 16.0,
                        ),
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      GestureDetector(
                        child: Text(
                          "<< Back",
                          style: TextStyle(
                            color: Colors.white30,
                            fontSize: 15.0,
                          ),
                        ),
                        onTap: () => Navigator.pop(context),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  width: 20.0,
                ),
                Stack(
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Container(
                          width: 30.0,
                          height: 30.0,
                        ),
                        Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(20.0),
                            ),
                          ),
                          color: Color(0xff292e30),
                          child: Container(
                            width: 130.0,
                            height: 130.0,
                          ),
                        ),
                      ],
                    ),
                    Positioned(
                      bottom: 20.0,
                      right: 10.0,
                      child: Image.asset(
                        "images/airpode_single.png",
                        height: 150.0,
                        width: 150.0,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 10.0,
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  isSelected = !isSelected;
                });
                //_modalBottomSheetMenu();
              },
              child: AnimatedContainer(
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: isSelected ? Color(0xff292e30) : Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(10.0),
                  ),
                ),
                height: 40.0,
                width: isSelected
                    ? 60.0
                    : MediaQuery.of(context).size.width - 40.0,
                duration: Duration(seconds: 1),
                child: isSelected
                    ? Center(
                        child: Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: CircularProgressIndicator(),
                        ),
                      )
                    : Center(
                        child: Text(
                        "Add to Cart!",
                        style: TextStyle(fontSize: 17.0),
                      )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
