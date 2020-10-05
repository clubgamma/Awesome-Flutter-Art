import 'package:flutter/material.dart';

const kTempTextStyle = TextStyle(
  fontFamily: 'Spartan MB',
  fontSize: 100.0,
);

const kMessageTextStyle = TextStyle(
  fontFamily: 'Spartan MB',
  fontSize: 60.0,
);

const kButtonTextStyle = TextStyle(
  color: Colors.pinkAccent,
  fontSize: 45.0,
  fontFamily: 'Spartan MB',
);

const kConditionTextStyle = TextStyle(
  fontSize: 100.0,
);

const kAPI = 'cc2a9612c93b65dd843e660e89a4c5a7';

const kTextfiedstyle=InputDecoration(
  filled: true,
  fillColor: Colors.white,
  icon: Icon(
    Icons.location_city,
    color: Colors.white,
    size: 25,
  ),
  hintText: 'Enter City Name',
  hintStyle: TextStyle(color: Colors.black),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(13),
    ),
    borderSide: BorderSide.none,
  ),
);