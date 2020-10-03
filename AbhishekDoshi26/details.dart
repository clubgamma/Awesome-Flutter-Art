import 'package:flutter/material.dart';
import 'package:flutter_page_transition/flutter_page_transition.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shopping_ui/screen.dart';

class Details extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Icon(
          FontAwesomeIcons.apple,
          size: 35.0,
        ),
      ),
      backgroundColor: Color(0xff292e30),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Image.asset(
                  "images/airpods_cut.png",
                  height: MediaQuery.of(context).size.height - 100.0,
                ),
                Expanded(
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width / 6,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 50.0),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      width: 80.0,
                      child: RotatedBox(
                        quarterTurns: 3,
                        child: Column(
                          children: <Widget>[
                            Text(
                              "Airpods 1st Gen.",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 40.0,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "Designed by Abhishek Doshi",
                                style: TextStyle(
                                  color: Colors.white30,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10.0,
            ),
            Padding(
              padding: EdgeInsets.only(right: 30.0),
              child: Align(
                alignment: Alignment.bottomRight,
                child: GestureDetector(
                  child: Text(
                    "Know More  >>",
                    style: TextStyle(color: Colors.white30),
                  ),
                  onTap: () => Navigator.of(context).push(
                    PageTransition(
                      type: PageTransitionType.slideInLeft,
                      duration: Duration(milliseconds: 500),
                      child: Screen(),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
