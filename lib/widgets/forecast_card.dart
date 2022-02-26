import 'package:flutter/material.dart';

import 'package:myweather/utilities/forecast_util.dart';
import '../models/weather-forecast-daily.dart';

Widget forecastCard(AsyncSnapshot<WeatherForecast> snapshot, int index) {
  var dayOfWeek = '';
  var forecastList = snapshot.data?.list;
  var icon = forecastList![index].getIconUrl();
  DateTime date =
      DateTime.fromMillisecondsSinceEpoch(forecastList[index].dt! * 1000);
  var fullDate = Util.getFormattedDate(date);
  dayOfWeek = fullDate.split(',')[0];
  var minTemp = forecastList[index].temp!.min!.toStringAsFixed(0);
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            dayOfWeek,
            style: TextStyle(fontSize: 25, color: Colors.white),
          ),
        ),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(children: [
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.all(8),
                  child: Text(
                    '$minTemp C',
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                    ),
                  ),
                ),
                Image.network(
                  icon,
                  scale: 1.2,
                )
              ],
            ),
          ]),
        ],
      )
    ],
  );
}
