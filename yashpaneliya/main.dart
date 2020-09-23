import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: MyWidget(),
    ),
  );
}

class MyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomPaint(
        painter:DashBird(),
        child: Container(),
      ),
    );
  }
}

class DashBird extends CustomPainter{
  @override 
  void paint(Canvas canvas,Size size){
    final width=size.width;
    final height=size.height;
    Paint paint=Paint();
    
    Path bigOval=Path();
    paint.color=Color.fromRGBO(89, 170, 255,1);
    bigOval.addOval(Rect.fromPoints(Offset(width*0.05,height*0.15),Offset(width*0.95,height*0.95)));
    canvas.drawPath(bigOval,paint); 
    
    //white curve
    Path whiteCurve=Path();
    whiteCurve.moveTo(width*0.18,height*0.68);
    whiteCurve.quadraticBezierTo(width*0.2,height*0.94,width*0.5,height*0.94);
    whiteCurve.moveTo(width*0.5,height*0.94);
    whiteCurve.quadraticBezierTo(width*0.8,height*0.94,width*0.82,height*0.68);
    whiteCurve.lineTo(width*0.18,height*0.68);
    whiteCurve.close();
    paint.color=Color.fromRGBO(242, 242, 242,1);
    canvas.drawPath(whiteCurve,paint);
    
    //blue curve just above white curve
    Path smallBlueCurve=Path();
    smallBlueCurve.moveTo(width*0.18,height*0.6799);
    smallBlueCurve.quadraticBezierTo(width*0.5,height*0.8,width*0.82,height*0.6799);
    paint.color=Color.fromRGBO(89, 170, 255,1);
    canvas.drawPath(smallBlueCurve,paint);
    
    //big blue circles for eyes
    paint.color=Color.fromRGBO(61, 145, 255,1);
    canvas.drawCircle(Offset(width*0.37,height*0.5),width*0.2,paint);
    canvas.drawCircle(Offset(width*0.63,height*0.5),width*0.2,paint);
    //black circles
    paint.color=Color.fromRGBO(0,0,0,1);
    canvas.drawCircle(Offset(width*0.35,height*0.47),width*0.07,paint);
    canvas.drawCircle(Offset(width*0.65,height*0.47),width*0.07,paint);
    
    //eye border
    Paint paintBorder=Paint()..color=Color.fromRGBO(32, 170, 140,1)
      ..style=PaintingStyle.stroke
      ..strokeWidth=6.0;
    canvas.drawCircle(Offset(width*0.35,height*0.47),width*0.07,paintBorder);
    canvas.drawCircle(Offset(width*0.65,height*0.47),width*0.07,paintBorder);
    
    //big white circles
    paint.color=Colors.white;
    canvas.drawCircle(Offset(width*0.35,height*0.47),width*0.02,paint);
    canvas.drawCircle(Offset(width*0.65,height*0.47),width*0.02,paint);
    //tiny white circle
    canvas.drawCircle(Offset(width*0.40,height*0.47),width*0.005,paint);
    canvas.drawCircle(Offset(width*0.69,height*0.45),width*0.005,paint);
    
    //legs
    Path oval=Path();
    paint.color=Color.fromRGBO(139, 94, 60,1); 
 //left side legs
    oval.addOval(Rect.fromPoints(Offset(width*0.28,height*0.885),Offset(width*0.32,height*0.98)));
    canvas.drawPath(oval,paint);
  oval.addOval(Rect.fromPoints(Offset(width*0.31,height*0.885),Offset(width*0.35,height*0.98)));
    canvas.drawPath(oval,paint);
  oval.addOval(Rect.fromPoints(Offset(width*0.34,height*0.885),Offset(width*0.38,height*0.98)));
    canvas.drawPath(oval,paint);
    //right side legs
    oval.addOval(Rect.fromPoints(Offset(width*0.64,height*0.885),Offset(width*0.6,height*0.98)));
    canvas.drawPath(oval,paint);
  oval.addOval(Rect.fromPoints(Offset(width*0.67,height*0.885),Offset(width*0.63,height*0.98)));
    canvas.drawPath(oval,paint);
  oval.addOval(Rect.fromPoints(Offset(width*0.7,height*0.885),Offset(width*0.66,height*0.98)));
    canvas.drawPath(oval,paint);
    
    //head fur
   Path head=Path();
    paint.color=Color.fromRGBO(89, 170, 255,1); 
    head.addOval(Rect.fromPoints(Offset(width*0.435,height*0.085),Offset(width*0.475,height*0.175)));
    canvas.drawPath(head,paint);
    head.addOval(Rect.fromPoints(Offset(width*0.465,height*0.085),Offset(width*0.505,height*0.175)));
    canvas.drawPath(head,paint);
    head.addOval(Rect.fromPoints(Offset(width*0.495,height*0.085),Offset(width*0.535,height*0.175)));
    canvas.drawPath(head,paint);
    
    //nose
    Path nose=Path();
    nose.moveTo(width*0.465,height*0.5);
    nose.quadraticBezierTo(width*0.5,height*0.45,width*0.54,height*0.5);
    nose.lineTo(width*0.5,height*0.65);
    nose.close();
    paint.color=Color.fromRGBO(139, 94, 60,1);
    canvas.drawPath(nose,paint);
    
    //wings
    //left wing
    Path wing1=Path();
    paint.color=Color.fromRGBO(61, 145, 255,1);
    wing1.addOval(Rect.fromPoints(Offset(width*0.035,height*0.45),Offset(width*0.165,height*0.78)));
    canvas.translate(width*0.1,height*0.6);
    canvas.rotate(-38);
    canvas.translate(-width*0.1,-height*0.6);
    canvas.drawPath(wing1,paint);
    //right wing
    Path wing2=Path();
    paint.color=Color.fromRGBO(61, 145, 255,1);
    wing2.addOval(Rect.fromPoints(Offset(width*0.805,height*0.53),Offset(width*0.935,height*0.87)));
    canvas.translate(width*0.6,height*0.75);
    canvas.rotate(32);
    canvas.translate(-width*0.6,-height*0.75);
    canvas.drawPath(wing2,paint);
  }
  
  @override
  bool shouldRepaint(old)
  {
    return old!=this;
  }
}
