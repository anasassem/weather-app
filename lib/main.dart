import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/provider/provider.dart';

import 'app/app.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (_) => MyProvider()
        ..getCurrentWeatherDate()
        ..getFiveDayDate()
        ..getTopFiveCities(),
      child: MyApp()));
}
