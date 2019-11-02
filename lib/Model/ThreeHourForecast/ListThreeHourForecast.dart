import 'package:weather_forecast/Model/ThreeHourForecast/ThreeHourForecast.dart';

class ListThreeHourForecast {
  List<ThreeHourForecast> list;

  ListThreeHourForecast({this.list});

  factory ListThreeHourForecast.fromJson(Map<String, dynamic> json) {
    var list = json['list'] as List;
    List<ThreeHourForecast> threeHourForecastList = list.map((i) => ThreeHourForecast.fromJson(i)).toList();

    return ListThreeHourForecast(list: threeHourForecastList);
  }
}