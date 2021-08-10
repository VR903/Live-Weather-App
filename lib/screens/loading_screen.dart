import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'location_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:clima/services/weather.dart';

const apiKey= '97c61ed3ec4a8ca5be36cd5326ed9e7b';

class LoadingScreen extends StatefulWidget
{
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  void initState()
  {
    super.initState();
    getLocationData();
  }
  void getLocationData() async
  {

    var weatherData= await WeatherModel().getLocationWeather();

        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return LocationScreen(locationWeather: weatherData,);
        }));

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.white,
          size: 100.0,
        ),
      ),
    );
  }
}
