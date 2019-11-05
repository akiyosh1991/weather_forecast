import 'dart:async';
import 'dart:convert';

import 'package:weather_forecast/Model/ThreeHourForecast/ListThreeHourForecast.dart';
import 'package:weather_forecast/Model/ThreeHourForecast/ThreeHourForecast.dart';
import 'package:http/http.dart' as http;

class ThreeHourForecastClient {

  Future getItems() async {
    final result = await http.get("http://api.openweathermap.org/data/2.5/forecast/?id=524901&APPID=f6e5e95822b542cf6b41e3273ab11a79");
    print(result);
    final jsonResponse = (await json.decode(result.body));
    final decodedList = ListThreeHourForecast.fromJson(jsonResponse).list;
    return decodedList;
  }
}