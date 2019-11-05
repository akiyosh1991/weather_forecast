import 'package:flutter/material.dart';
import 'package:weather_forecast/Controllers/top.dart';
import 'package:weather_forecast/Blocs/ThreeHourForecastBloc.dart';
import 'package:weather_forecast/Blocs/BlocProvider.dart';

void main() => runApp( BlocProvider<ThreeHourForecastBloc>(
  bloc: ThreeHourForecastBloc(),
  child: MyHomePage(),
));


