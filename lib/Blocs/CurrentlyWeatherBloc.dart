// dart lang
import 'dart:async';

// 3rd party packages
import 'package:bloc_provider/bloc_provider.dart';
import 'package:rxdart/subjects.dart';
import 'package:weather_forecast/Model/CurrentlyWeather.dart';

enum CurrentlyWeatherEventAction {
  create,
  read,
  update,
  delete
}

class CurrentlyWeatherEvent<T> {
  final CurrentlyWeatherEventAction action;
  final CurrentlyWeather currentlyWeather;

  CurrentlyWeatherEvent({this.action, this.currentlyWeather});
}

class CurrentlyWeatherBloc implements Bloc {

  static List<CurrentlyWeather> _currentlyWeatherList = [];
  // 入力Streamの制御
  final StreamController<CurrentlyWeatherEvent> _inputController = StreamController();
  // 出力Streamの制御
  final BehaviorSubject<List<CurrentlyWeather>> _outputController = BehaviorSubject.seeded(_currentlyWeatherList);
  // 入力Stream
  Sink<CurrentlyWeatherEvent> get setCurrentlyWeather => _inputController.sink;
  // 出力Stream
  Stream<List<CurrentlyWeather>> get getCurrentlyWeatherList =>_outputController.stream;

  // 新規でCurrentlyWeatherを作成する
  void _createCurrentlyWeather({CurrentlyWeather currentlyWeather}) {
    _currentlyWeatherList.add( CurrentlyWeather(
      weather: currentlyWeather.weather,
      hour: currentlyWeather.hour,
      temp: currentlyWeather.temp
    ));
  }

  // 入力Streamのリスナ
  void _currentlyEventListener(CurrentlyWeatherEvent e) {
    if (e.action == CurrentlyWeatherEventAction.create) {
      // createアクションだった場合
      _createCurrentlyWeather(currentlyWeather: e.currentlyWeather);
    }
    // Taskのリスト更新後、出力Streamに流し込む
    _outputController.add(_currentlyWeatherList);
  }

  // コンストラクタ
  TasksBloc() {
    // 入力Streamをリッスンしてリスナを登録
    _inputController.stream.listen(_currentlyEventListener);
  }

  // ステートが破棄された場合、Streamを閉じて破棄する
  @override
  void dispose() async {
    await _inputController.close();
    await _outputController.close();
  }
}