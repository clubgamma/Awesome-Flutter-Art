import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return MaterialApp(
      title: 'Clock',
      home: HomePage(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  Animation pandulumAnimation;
  Animation degOneTranslationAnimation,
      degTwoTranslationAnimation,
      degThreeTranslationAnimation;
  Animation rotationAnimation;

  AnimationController pandulumController;
  AnimationController rotationController;

  double imgSize;

  double getRadiansFromDegree(double degree) {
    double unitRadian = 57.295779513;
    return degree / unitRadian;
  }

  @override
  void initState() {
    super.initState();
    pandulumController =
        AnimationController(vsync: this, duration: Duration(seconds: 1));

    rotationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 250));

    degOneTranslationAnimation = TweenSequence([
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: 0.0, end: 1.3), weight: 70.0),
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: 1.3, end: 1.0), weight: 30.0),
    ]).animate(rotationController);
    degTwoTranslationAnimation = TweenSequence([
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: 0.0, end: 1.5), weight: 45.0),
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: 1.5, end: 1.0), weight: 55.0),
    ]).animate(rotationController);

    rotationAnimation = Tween<double>(begin: 180.0, end: 0.0).animate(
        CurvedAnimation(parent: rotationController, curve: Curves.easeOut));

    pandulumAnimation =
        CurvedAnimation(parent: pandulumController, curve: Curves.easeInOut);
    pandulumAnimation = Tween(begin: -0.5, end: 0.5).animate(pandulumAnimation);

    pandulumController.addListener(() {
      if (pandulumController.isCompleted) {
        pandulumController.reverse();
      } else if (pandulumController.isDismissed) {
        pandulumController.forward();
      }
      setState(() {});
    });

    rotationController.addListener(() {
      setState(() {});
    });
    pandulumController.forward();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      extendBody: true,
      body: Stack(
        children: [
          Container(
            width: size.width,
            height: size.height,
            child: Center(
              child: Container(
                child: Column(
                  children: [
                    SizedBox(height: 50.0),
                    Text(
                      'Clock',
                      style: GoogleFonts.courgette(
                          fontSize: 35.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.deepOrangeAccent),
                    ),
                    SizedBox(height: 20.0),
                    Material(
                      borderRadius: BorderRadius.all(Radius.circular(50.0)),
                      elevation: 10.0,
                      clipBehavior: Clip.antiAlias,
                      child: Container(
                        width: size.width * 0.8,
                        height: size.width * 0.8,
                        color: Colors.deepOrange[900],
                        child: Center(
                          child: Text(
                            DateFormat('EEE, MMM d\nhh:mm a')
                                .format(DateTime.now()),
                            textAlign: TextAlign.center,
                            style: GoogleFonts.merienda(
                                fontSize: 45.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 18.0,
                    ),
                    Transform(
                      alignment: FractionalOffset(0.5, size.height * 0.000042),
                      transform: Matrix4.rotationZ(pandulumAnimation.value),
                      child: Container(
                        child: Image.asset(
                          'images/pandulum.png',
                          height: size.height * 0.35,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            right: 25,
            bottom: 25,
            child: Stack(
              alignment: Alignment.bottomRight,
              children: <Widget>[
                IgnorePointer(
                  child: Container(
                    height: 150.0,
                    width: 150.0,
                  ),
                ),
                Transform.translate(
                  offset: Offset.fromDirection(getRadiansFromDegree(180),
                      degOneTranslationAnimation.value * 90),
                  child: Transform(
                    transform: Matrix4.rotationZ(
                        getRadiansFromDegree(rotationAnimation.value))
                      ..scale(degOneTranslationAnimation.value),
                    alignment: Alignment.center,
                    child: CircularButton(
                      color: Colors.deepOrangeAccent[400],
                      width: size.width * 0.15,
                      height: size.width * 0.15,
                      icon: Icon(
                        Icons.add,
                        color: Colors.white,
                        size: 28.0,
                      ),
                      onClick: () {},
                    ),
                  ),
                ),
                Transform.translate(
                  offset: Offset.fromDirection(getRadiansFromDegree(180),
                      degTwoTranslationAnimation.value * 170),
                  child: Transform(
                    transform: Matrix4.rotationZ(
                        getRadiansFromDegree(rotationAnimation.value))
                      ..scale(degTwoTranslationAnimation.value),
                    alignment: Alignment.center,
                    child: CircularButton(
                      color: Colors.deepOrangeAccent[400],
                      width: size.width * 0.15,
                      height: size.width * 0.15,
                      icon: Icon(
                        Icons.timer,
                        color: Colors.white,
                        size: 28.0,
                      ),
                      onClick: () {},
                    ),
                  ),
                ),
                Transform(
                  transform: Matrix4.rotationZ(
                      getRadiansFromDegree(rotationAnimation.value)),
                  alignment: Alignment.center,
                  child: CircularButton(
                    color: Colors.deepOrange[900],
                    width: size.width * 0.18,
                    height: size.width * 0.18,
                    icon: Icon(
                      Icons.menu,
                      color: Colors.white,
                      size: 30.0,
                    ),
                    onClick: () {
                      if (rotationController.isCompleted) {
                        rotationController.reverse();
                      } else {
                        rotationController.forward();
                      }
                    },
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CircularButton extends StatelessWidget {
  final double width;
  final double height;
  final Color color;
  final Icon icon;
  final Function onClick;

  CircularButton(
      {this.color, this.width, this.height, this.icon, this.onClick});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
      width: width,
      height: height,
      child: IconButton(icon: icon, enableFeedback: true, onPressed: onClick),
    );
  }
}
