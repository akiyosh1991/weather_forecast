import 'package:weather_forecast/Model/ThreeHourForecast/Main.dart';

class ThreeHourForecast {
  final String date;
  final Main listMain;

  ThreeHourForecast({this.date, this.listMain});

  factory ThreeHourForecast.fromJson(Map<String, dynamic> json) {
    return ThreeHourForecast(
      date: json['dt_txt'],
      listMain: Main.fromJson(json['main'])
    );
  }
}