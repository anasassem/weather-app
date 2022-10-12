import 'package:flutter/material.dart';
import 'package:weather_app/domain/models/current_weather_data.dart';
import 'package:weather_app/domain/models/five_day_data.dart';
import 'package:weather_app/service/weather_service.dart';

class MyProvider extends ChangeNotifier {
  String? city='cairo';
  CurrentWeatherData currentWeatherData = CurrentWeatherData();
  List<FiveDayData> fiveDayData = [];
  List<CurrentWeatherData> dataList = [];


  void getCurrentWeatherDate() {
    WeatherService(city: '$city').getCurrentWeatherDate(onSuccess: (data) {
      currentWeatherData = data;
      notifyListeners();
    }, onError: (error) {
      print(error.toString());
      notifyListeners();
    });
  }

  void getFiveDayDate() {
    WeatherService(city: '$city').getFiveDayWeatherDate(onSuccess: (data) {
      fiveDayData = data;
      notifyListeners();
    }, onError: (error) {
      print(error.toString());
      notifyListeners();
    });
  }

  void getTopFiveCities() {
    List<String> cities = [
      'zagazig',
      'cairo',
      'alexandria',
      'ismailia',
      'fayoum'
    ];
    cities.forEach((element) {
      WeatherService(city: element).getCurrentWeatherDate(onSuccess: (data) {
        dataList.add(data);
        notifyListeners();
      }, onError: (error) {
        print(error.toString());
        notifyListeners();
      });
    });
  }
}
