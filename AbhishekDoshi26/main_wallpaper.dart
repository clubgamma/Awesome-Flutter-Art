import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wallpaper/splash.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
      darkTheme: ThemeData.dark().copyWith(
        canvasColor: Colors.transparent,
      ),
    );
  }
}
