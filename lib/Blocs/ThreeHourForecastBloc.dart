
import 'dart:async';
import 'package:weather_forecast/Blocs/BlocProvider.dart';
import 'package:weather_forecast/Model/ApiClient.dart';
import 'package:weather_forecast/Model/ThreeHourForecast/ThreeHourForecast.dart';


class ThreeHourForecastBloc implements BlocBase {
  StreamController<List<ThreeHourForecast>> _threeHourForecastController = StreamController<List<ThreeHourForecast>>();
  StreamSink<List<ThreeHourForecast>> get items => _threeHourForecastController.sink;
  Stream<List<ThreeHourForecast>> get outStream => _threeHourForecastController.stream;

  ThreeHourForecastBloc() {
    _getItems();
  }

  @override
  void dispose() {
    _threeHourForecastController.close();
  }

  void _getItems() async {
    final itemList = await ThreeHourForecastClient().getItems();
    print(itemList);
    _threeHourForecastController.sink.add(itemList);
  }

}