import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:myweather/api/weather_api.dart';
import 'package:myweather/models/weather-forecast-daily.dart';
import 'package:myweather/screens/weather_forecast_screen.dart';

class LOcationScreen extends StatefulWidget {
  const LOcationScreen({Key? key}) : super(key: key);

  @override
  _LOcationScreenState createState() => _LOcationScreenState();
}

class _LOcationScreenState extends State<LOcationScreen> {
  
  void getLocationData() async {
    var weatherInfo = await WeatherApi().fetchWeatherForecast();
    if (weatherInfo == null) {
      print('WeatherInfo was null: $weatherInfo');
      return;
    }
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) {
        return WeatherForecastScreen(
          locationWeather: weatherInfo,
        );
      }),
    );
  }

  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(size: 100, color: Colors.blue,),
      ),
    );
  }
}
