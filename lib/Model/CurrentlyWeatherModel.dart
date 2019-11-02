
class CurrentlyWeatherModel {
  String weather;
  String hour;
  int temp;

  CurrentlyWeatherModel.fromJson(Map<String, dynamic> json)
    : weather = json['weather'] as String,
        hour  = json['hour'] as String,
        temp = json['temp'] as int;
}


