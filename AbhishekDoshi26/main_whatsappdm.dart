import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:whatsapp_dm/splash.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Whatsapp DM',
      theme: ThemeData.dark(),
      home: SplashScreen(),
    );
  }
}
