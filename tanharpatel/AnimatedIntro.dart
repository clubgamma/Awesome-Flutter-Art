import 'dart:async';
import 'package:flutter/material.dart';
import 'package:delayed_display/delayed_display.dart';

void main() {
  runApp(RotateText());
}

class RotateText extends StatefulWidget {
  @override
  _RotateTextState createState() => _RotateTextState();
}

class _RotateTextState extends State<RotateText> with TickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _animation;
  int time = 0;

  @override
  void initState() {
    super.initState();
    Timer(Duration(milliseconds: 10650), () => _controller.dispose());
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true);

    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.fastOutSlowIn,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DelayedDisplay(
              delay: Duration(seconds: 1),
              child: RotationTransition(
                turns: _animation,
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text("Hello, I am", style: TextStyle(fontSize: 30, color: Colors.white),),
                ),
              ),
            ),
            DelayedDisplay(
              delay: Duration(seconds: 3),
              child: RotationTransition(
                turns: _animation,
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text("Flutter Developer", style: TextStyle(fontSize: 30, color: Colors.white),),
                ),
              ),
            ),
            DelayedDisplay(
              delay: Duration(seconds: 5),
              child: RotationTransition(
                turns: _animation,
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text("Android Developer", style: TextStyle(fontSize: 30, color: Colors.white),),
                ),
              ),
            ),
            DelayedDisplay(
              delay: Duration(seconds: 7),
              child: RotationTransition(
                turns: _animation,
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text("Web Developer", style: TextStyle(fontSize: 30, color: Colors.white),),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}