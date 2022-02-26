import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:myweather/models/weather-forecast-daily.dart';
import 'package:myweather/utilities/constants.dart';
import 'package:myweather/utilities/location.dart';

class WeatherApi {
  Future<WeatherForecast> fetchWeatherForecast(
      {String? cityName, bool? isCity}) async {
    Location location = Location();

    Map<String, String>? parameters;
    if (cityName != null) {
      var queryParameters = {
        'appid': Constants.WEATHER_APP_API,
        'units': 'metric',
        'q': cityName,
      };
      parameters = queryParameters.cast<String, String>();
    } else {
      await location.getGeolocation();
      var queryParameters = {
        'appid': Constants.WEATHER_APP_API,
        'units': 'metric',
        'lat': location.latitude.toString(),
        'lon': location.longitude.toString(),
      };
      parameters = queryParameters.cast<String, String>();
    }

    var uri = Uri.https(Constants.WEATHER_BASE_URL_DOMAIN,
        Constants.WEATHER_FORECAST_PATH, parameters);
    log('requiest: ${uri.toString()}');
    var response = await http.get(uri);
    print('response:${response.body}');
    if (response.statusCode == 200) {
      return WeatherForecast.fromJson(json.decode(response.body));
    } else {
      throw Exception('Error response');
    }
  }
}
