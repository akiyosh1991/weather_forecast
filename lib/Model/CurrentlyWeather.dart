
class CurrentlyWeather {
  final String weather;
  final String hour;
  final int temp;

  CurrentlyWeather({
    this.weather = '',
    this.hour = '',
    this.temp
});

  CurrentlyWeather copyWith({String weather, String hour, int temp}) {
    return CurrentlyWeather(
      weather: weather ?? this.weather,
      hour: hour ?? this.hour,
      temp: temp ?? this.temp
    );
  }


}


