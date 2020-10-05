import 'package:flutter/material.dart';
import 'package:weatherx/services/weather.dart';
import 'city_screen.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:weather_icons/weather_icons.dart';

class LocationScreen extends StatefulWidget {
  LocationScreen({this.locationweather});
  final locationweather;
  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  WeatherModel weather = WeatherModel();

  int temp;
  Icon weathericon;
  String displayText;
  int temp_min;
  int temp_max;
//  double temp_mn;
//  double temp_mx;
  String subtxt;

  String cityname;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    updateUI(widget.locationweather);
  }

  void updateUI(dynamic weatherData) {
    setState(() {
      if (weatherData == null) {
        temp = 0;
        weathericon = Icon(Icons.error_outline);
        cityname = 'the app';
        return;
      }
       temp = weatherData['main']['temp'].toInt();

      temp_min = (weatherData['main']['temp_min']).toInt();
      temp_max =(weatherData['main']['temp_max']).toInt();
//     double temp_mn = weatherData['main']['temp_min'];
//      temp_min=temp_mn.toInt();
//      double temp_mx = weatherData['main']['temp_max'];
//       temp_max=temp_mx.toInt();
      displayText = weather.getMessage(temp);

      var condition = weatherData['weather'][0]['id'];
      weathericon = weather.getWeatherIcon(condition);
      subtxt = weather.subtext(condition);
      cityname = weatherData['name'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
//      backgroundColor: Colors.white,
      body: Container(
        child: SafeArea(
          child: Column(
            children: <Widget>[
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[




                    FlatButton(
                      onPressed: () async {
                        var weatherData = await weather.locationWeather();
                        updateUI(weatherData);
                      },
                      child: Icon(

                        Icons.gps_fixed,
                        size: 30,
                        color: Colors.white,
                      ),
                    ),
                    FlatButton(
                      onPressed: () async {
                        var typedname = await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return CityScreen();
                            },
                          ),
                        );
                        if (typedname != null) {
                          var weatherdata =
                          await weather.cityWeather(typedname);
                          updateUI(weatherdata);
                        }
                      },
                      child: Icon(
                        FontAwesomeIcons.city,
                        size: 28.0,
                        color: Colors.redAccent,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                  padding: EdgeInsets.fromLTRB(50, 50, 50, 0),
                  child: Row(
                    children: <Widget>[
                      SizedBox(
                        child: Text(
                          cityname,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 35,
                          ),
                        ),
                      ),
                    ],
                  )),

              Expanded(
                flex: 9,
                child: Container(



                  margin: EdgeInsets.fromLTRB(50, 30, 50, 80),

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,

                    children: <Widget>[
                      SizedBox(height: 10,),
                      Expanded(
                        flex: 2,
                        child: Padding(
                          padding: EdgeInsets.only(left: 20),
                          child: Text(
                            '$temp°',
                            style: TextStyle(
                                fontSize: 75,
                                fontWeight: FontWeight.bold,

                                ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Padding(
                          padding: EdgeInsets.only(left: 20),
                          child: Text(
                            subtxt,
                            style: TextStyle(
                              fontSize: 30,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(20, 0, 10, 50),
                        child: Container(
                          child: Text(
                            "$displayText in $cityname",
                            style: TextStyle(
                                fontSize: 21,
                                color: Colors.grey[500],
                                ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: SizedBox(
                          child: Divider(
                            color: Colors.redAccent,
                          ),
                        ),
                      ),
                      Row(
                        children: <Widget>[
                          Expanded(
                              child: Padding(
                                padding: EdgeInsets.fromLTRB(0, 0, 0, 38),
                                //padding: const EdgeInsets.all(8.0),
                                child: weathericon,
                              )),
                          SizedBox(width: 100,),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(20, 0, 0, 38),
                              child: Text(
                                '$temp_min°-$temp_max°',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.grey[500],
                                ),
                              ),
                            ),
                          ),


                        ],
                      )
                    ],
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color:  Color(0xFF0C0C0C),
                  ),

                ),

              ),
              Expanded(
                flex: 1,
                //margin: EdgeInsets.only(bottom: 50),
                child: TyperAnimatedTextKit(
                    text: [
                      "Created by Zafer",
                    ],
                    textStyle: TextStyle(
                      color: Colors.redAccent,
                      fontSize: 25.0,
                    ),
                    textAlign: TextAlign.start,
                    alignment:
                    AlignmentDirectional.topStart // or Alignment.topLeft
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//Color(0xFF0C0C0C)