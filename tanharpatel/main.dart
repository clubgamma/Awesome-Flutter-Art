import 'package:flutter/material.dart';

void main() {
  runApp(AnimatedText());
}

class AnimatedText extends StatefulWidget {
  @override
  _AnimatedTextState createState() => _AnimatedTextState();
}

class _AnimatedTextState extends State<AnimatedText> with TickerProviderStateMixin {
  AnimationController _animationController;
  Animation _animation;

  @override
  void initState() {
    _animationController = AnimationController(vsync: this, duration: Duration(seconds: 1));
    _animationController.repeat(reverse: true);
    _animation = Tween(begin: 0.0, end: 1.0).animate(_animationController)..addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ShaderMask(
          shaderCallback: (rect) => LinearGradient(
            stops: [_animation.value - 0.8.toDouble(), _animation.value - 0.7.toDouble(), _animation.value - 0.6.toDouble(), _animation.value - 0.5.toDouble(),
            _animation.value - 0.4.toDouble(), _animation.value - 0.3.toDouble(), _animation.value - 0.2.toDouble(), _animation.value - 0.1.toDouble(), 
            _animation.value, _animation.value + 0.1.toDouble(), _animation.value + 0.2.toDouble(), _animation.value + 0.3.toDouble(), _animation.value + 0.4.toDouble()
            , _animation.value + 0.5.toDouble(), _animation.value + 0.6.toDouble(), _animation.value + 0.7.toDouble(), _animation.value + 0.8.toDouble()],
            colors: [
              Colors.red,
              Colors.pink,
              Colors.purple,
              Colors.deepPurple,
              Colors.deepPurple,
              Colors.indigo,
              Colors.blue,
              Colors.lightBlue,
              Colors.cyan,
              Colors.teal,
              Colors.green,
              Colors.lightGreen,
              Colors.lime,
              Colors.yellow,
              Colors.amber,
              Colors.orange,
              Colors.deepOrange,
            ]
          ).createShader(rect),
          child: Text("Happy Fluttering!!!",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}