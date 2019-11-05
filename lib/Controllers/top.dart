import 'package:flutter/material.dart';
import 'package:weather_forecast/Blocs/BlocProvider.dart';
import 'package:weather_forecast/Blocs/ThreeHourForecastBloc.dart';
import 'package:weather_forecast/Model/ThreeHourForecast/ThreeHourForecast.dart';
import 'package:flutter/cupertino.dart';
import 'package:weather_forecast/Views/weather_forecast_listview.dart';
import 'package:weather_forecast/Views/main_top_view.dart';

class ThreeHourForecastStateless extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<ThreeHourForecastBloc>(
      bloc: ThreeHourForecastBloc(),
      child: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final _mainTopView = MainTopView();
  final _weatherForecastListView = WeatherForeCastListView();

  @override
  Widget build(BuildContext context) {
    final ThreeHourForecastBloc bloc = BlocProvider.of<ThreeHourForecastBloc>(context);

    return MaterialApp(
      home: Scaffold(
        body: StreamBuilder<List<ThreeHourForecast>>(
            stream: bloc.outStream,
            builder: (context, snapshot) {
              if (snapshot == null || snapshot.data == null) {
                return Center(
                    child: CircularProgressIndicator()
                );
              }
              return ListView.builder(itemBuilder: (context, position) {
                var item = snapshot.data[position];
                return _threeHourForecastListView(item);
              });
            }),
// TODO: 下記WidgetにAPIから取得したListViewを表示出来るように実装する
//      body: Container(
//          decoration: BoxDecoration(
//              image: DecorationImage(
//            image: AssetImage('images/sunny/sunny.jpg'),
//            fit: BoxFit.cover,
//          )),
//          child: Column(
//            crossAxisAlignment: CrossAxisAlignment.center,
//            children: <Widget>[
//              _mainTopView,
//              _weatherForecastListView
//            ],
//          ))
      )
    );
  }

  Widget _threeHourForecastListView(ThreeHourForecast item) {
    return Card(
      child: ListTile(
        title: Text(item.date)
      ),
    );
  }
}
