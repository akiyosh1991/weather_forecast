class ThreeHourForecast {
  final String date;

  ThreeHourForecast({this.date});

  factory ThreeHourForecast.fromJson(Map<String, dynamic> json) {
    return ThreeHourForecast(
      date: json['dt_txt']
    );
  }
}