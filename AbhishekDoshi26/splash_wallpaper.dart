import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_page_transition/flutter_page_transition.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_page_transition/flutter_page_transition.dart';
import 'package:wallpaper/constants.dart';
import 'home.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  AnimationController logoController;
  Animation logoAnimation;
  @override
  void initState() {
    super.initState();
    logoController = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
    );
    logoController.forward(); //Proceeds animation forward
    logoController.addListener(() {
      setState(() {});
    });
    logoAnimation = CurvedAnimation(
      parent: logoController,
      curve: Curves.bounceInOut,
    );

    Timer(
      Duration(seconds: 3),
      () => Navigator.of(context).pushReplacement(
        PageTransition(
          type: PageTransitionType.fadeIn,
          child: Home(),
          duration: Duration(seconds: 1),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackground,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
              backgroundColor: Colors.transparent,
              radius: logoAnimation.value * 90.0,
              child: Image.asset('images/square_logo.png'),
            ),
            SizedBox(
              height: 30.0,
            ),
            ShaderMask(
              shaderCallback: (Rect bounds) {
                return RadialGradient(
                  center: Alignment.topLeft,
                  radius: 1.0,
                  colors: <Color>[
                    kColor1,
                    kColor2,
                    kColor3,
                    kColor4,
                    kColor5,
                    kColor6
                  ],
                  tileMode: TileMode.mirror,
                ).createShader(bounds);
              },
              child: Text(
                'Wallpaper',
                style: GoogleFonts.sansita(
                  fontSize: logoAnimation.value * 50.0,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
