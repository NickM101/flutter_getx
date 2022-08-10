import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:weather_flutter_getx/models/weather_data.dart';
import 'package:weather_flutter_getx/models/weather_data_current.dart';
import 'package:weather_flutter_getx/utils/api_url.dart';

class FetchWeatherAPI {
  WeatherData? weatherData;

  // Processing the data from response > toJSON
  Future<WeatherData> processData(lat, lon) async {
    var response = await http.get(Uri.parse(apiURL(lat, lon)));
    var jsonString = jsonDecode(response.body);
    weatherData = WeatherData(WeatherDataCurrent.fromJson(jsonString));

    return weatherData!;
  }
}
