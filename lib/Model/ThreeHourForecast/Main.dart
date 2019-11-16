class Main {
  final double tempMax;
  final double tempMin;

  Main({this.tempMax, this.tempMin});

  factory Main.fromJson(Map<String, dynamic> json) {
    return Main(
      tempMax: json['temp_max'],
      tempMin: json['temp_min']
    );
  }
}