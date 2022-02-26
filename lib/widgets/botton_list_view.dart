import 'package:flutter/material.dart';

import '../models/weather-forecast-daily.dart';
import 'forecast_card.dart';

class BottomListView extends StatelessWidget {
  final AsyncSnapshot<WeatherForecast> snapshot;
  const BottomListView({Key? key, required this.snapshot}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          '7-day Weather Forecast'.toUpperCase(),
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black54,
          ),
        ),
        Container(
          height: 140,
          padding: EdgeInsets.symmetric(
            vertical: 16,
            horizontal: 16,
          ),
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: snapshot.data!.list!.length,
            separatorBuilder: (context, index) => SizedBox(
              width: 8,
            ),
            itemBuilder: (context, index) => Container(
              width: MediaQuery.of(context).size.width / 2.7,
              height: 160,
              color: Colors.black87,
              child: forecastCard(snapshot, index),
            ),
          ),
        )
      ],
    );
  }
}
