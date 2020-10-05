import 'package:flutter/material.dart';



import 'package:weatherx/services/weather.dart';
import 'locationscreen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {




  @override
  void initState() {

    super.initState();
 getLocationData();


  }

  void getLocationData() async{
    WeatherModel weatherModel =WeatherModel();
    var weatherData=await weatherModel.locationWeather();

    Navigator.push(context, MaterialPageRoute(builder: (context)
    {
      return LocationScreen(locationweather: weatherData,);

    }
    ));


  }

  @override
  Widget build(BuildContext context)
  {

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
            child: SpinKitCubeGrid(
            color: Colors.redAccent,
            size: 100.0,
            ),
          ),
          SizedBox(height: 30,),
          Container(
            child: Text(
              "WeatherX ️ ",
              style: TextStyle(
                fontSize: 55,
                color: Colors.redAccent,
              ),
            ),
          ),
        ],
      ),);
  }
}