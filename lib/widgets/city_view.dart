import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:myweather/models/weather-forecast-daily.dart';
import 'package:myweather/utilities/forecast_util.dart';

class CityView extends StatelessWidget {
  final AsyncSnapshot<WeatherForecast> snapshot;
  const CityView({Key? key, required this.snapshot}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var city = snapshot.data?.city?.name;
    var country = snapshot.data?.city?.country;
    var forecastList = snapshot.data?.list;
    var formattedDate =
        DateTime.fromMillisecondsSinceEpoch(forecastList![0].dt! * 1000);
    return Container(
        child: Column(
      children: <Widget>[
        Text(
          '${city}, ${country}',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 28.0,
          ),
        ),
        Text(
          Util.getFormattedDate(formattedDate),
          style: TextStyle(fontSize: 15.0),
        )
      ],
    ));
  }
}
