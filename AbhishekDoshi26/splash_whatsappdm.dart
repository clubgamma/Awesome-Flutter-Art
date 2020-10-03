import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:page_transition/page_transition.dart';
import 'package:whatsapp_dm/home.dart';

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
      Duration(seconds: 2),
      () => Navigator.of(context).pushReplacement(
        PageTransition(
          type: PageTransitionType.fade,
          child: HomePage(),
          duration: Duration(seconds: 2),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Image.asset(
          'images/background.png',
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.cover,
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SvgPicture.asset(
                  'images/logo.svg',
                  height: logoAnimation.value * 150.0,
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
                        Colors.red,
                        Color(0xfff14a4d),
                        Colors.deepOrange,
                        Color(0xfffabd26),
                        Colors.yellow,
                        Colors.yellowAccent
                      ],
                      tileMode: TileMode.mirror,
                    ).createShader(bounds);
                  },
                  child: Text(
                    'WhatsApp DM',
                    style: TextStyle(
                      fontSize: 30.0,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
