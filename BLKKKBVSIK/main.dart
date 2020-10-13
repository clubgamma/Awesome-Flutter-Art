import 'dart:math';
import 'dart:ui';
import 'package:flutter/rendering.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyWidget(),
    ),
  );
}
class MyWidget extends StatefulWidget{
  @override
  MyWidgetState createState() => MyWidgetState();
}
class MyWidgetState extends State<MyWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: InkWell(
        onTap:(){
            setState((){

            });
        },
        child:CustomPaint(
        painter:Colored(),
        child: Container(),
      )),
    );
  }
}

class Colored extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final frames = 200;
    canvas.drawPaint(Paint()..color = Colors.teal);

    for (double i = 10; i < frames; i += .1) {
      canvas.translate(i % 50, i % 70);
      canvas.save();
      canvas.rotate(pi / i * 50);
      final area = Offset(i, i) & Size(i * 10, i * 10);
      final int tailFibers = (i * 5.1).toInt();
      for (double d = 0; d < area.width; d += tailFibers) {
        for (double e = 0; e < area.height; e += tailFibers) {
          final tailWidth = .7 + (i * .2 * Random().nextDouble());
          canvas.drawCircle(
              Offset(d, e),
              tailWidth,
              Paint()
                ..color = Colors.white.withOpacity(.5));
        }
      }
      canvas.restore();
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
} 