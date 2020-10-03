import 'package:flutter/material.dart';

class Help extends StatelessWidget {
  const Help({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pop(context),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          backgroundColor: Colors.transparent,
          elevation: 100.0,
          title: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(20.0),
              ),
            ),
            elevation: 30.0,
            color: Color(0xff292e30),
            child: Hero(
              tag: 'image',
              child: Image.asset(
                'images/airpods_complete.png',
                height: 300.0,
                width: 300.0,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
