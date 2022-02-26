import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:myweather/api/weather_api.dart';
import 'package:myweather/models/weather-forecast-daily.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:myweather/screens/city_screen.dart';
import 'package:myweather/widgets/botton_list_view.dart';
import 'package:myweather/widgets/city_view.dart';
import 'package:myweather/widgets/detail_view.dart';
import 'package:myweather/widgets/temp_view.dart';

class WeatherForecastScreen extends StatefulWidget {
  final locationWeather;
  const WeatherForecastScreen({Key? key, this.locationWeather})
      : super(key: key);

  @override
  _WeatherForecastScreenState createState() => _WeatherForecastScreenState();
}

class _WeatherForecastScreenState extends State<WeatherForecastScreen> {
  late Future<WeatherForecast> forecastObject;

  String _cityName = 'Ulan-Ude';

  @override
  void initState() {
    super.initState();
    if (widget.locationWeather != null) {
      forecastObject = Future.value(widget.locationWeather);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.my_location),
          onPressed: () {
            setState(() {
              forecastObject = WeatherApi().fetchWeatherForecast();
            });
          },
        ),
        title: Text('OpenWeatherMap.org'),
        actions: [
          IconButton(
              onPressed: () async {
                var tapedName = await Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return CityScreen();
                  }),
                );
                if (tapedName != null) {
                  setState(() {
                    _cityName = tapedName;
                    forecastObject = WeatherApi().fetchWeatherForecast(
                        cityName: _cityName, isCity: true);
                  });
                }
              },
              icon: Icon(Icons.location_city)),
        ],
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          Container(
            child: FutureBuilder<WeatherForecast>(
              future: forecastObject,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Column(
                    children: [
                      const SizedBox(
                        height: 50,
                      ),
                      CityView(
                        snapshot: snapshot,
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      TemView(snapshot: snapshot),
                      const SizedBox(height: 50),
                      DetailView(snapshot: snapshot),
                      const SizedBox(
                        height: 50,
                      ),
                      BottomListView(snapshot: snapshot),
                    ],
                  );
                } else {
                  return Center(
                    child: SpinKitDoubleBounce(
                      size: 100.0,
                      color: Colors.cyan,
                    ),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
