import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:weather_flutter/models/model.dart';

class DataService {
  Future<WeatherResponse> getWeather(String city) async {
    // api.openweathermap.org/data/2.5/weather?q={city name}&appid={API key}
    final queryParameters = {
      'q': city,
      'appid': '3c2001187d4600ea135c6edb96d3dc11',
      'units': 'metric'
    };
    final uri = Uri.https(
        'api.openweathermap.org', '/data/2.5/weather', queryParameters);
    final response = await http.get(uri);
    // print(response.body);
    final json = jsonDecode(response.body);
    return WeatherResponse.fromJson(json);
  }
}
