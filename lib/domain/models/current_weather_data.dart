import 'package:weather_app/domain/models/clouds.dart';
import 'package:weather_app/domain/models/coord.dart';
import 'package:weather_app/domain/models/main_weather_model.dart';
import 'package:weather_app/domain/models/sys.dart';
import 'package:weather_app/domain/models/weather.dart';
import 'package:weather_app/domain/models/wind.dart';

class CurrentWeatherData {
  CoordModel? coord;
  List<WeatherModel>? weather;
  String? base;
  MainWeatherModel? main;
  int ?visibility;
  WindModel? wind;
  CloudModel? cloud;
  double ?dt;
  SysModel? sys;
  double ?timezone;
  double?id;
  String ?name;
  int ?cod;

  CurrentWeatherData({
    this.coord,
    this.weather,
    this.base,
    this.main,
    this.visibility,
    this.wind,
    this.cloud,
    this.dt,
    this.sys,
    this.timezone,
    this.id,
    this.name,
    this.cod,
  });

  factory CurrentWeatherData.fromJson(Map<String, dynamic> json) {
    return CurrentWeatherData(
      coord: CoordModel.fromJson(json["coord"]),
      // weather: List<WeatherModel>.of(json["weather"])
      //     .map((i) => i /* can't generate it properly yet */)
      //     .toList(),
      weather: json["weather"].map<WeatherModel>((e)=> WeatherModel.fromJson(e)).toList(),
      base: json["base"],
      main: MainWeatherModel.fromJson(json["main"]),
      visibility: int.parse(json["visibility"].toString()),
      wind: WindModel.fromJson(json["wind"]),
      cloud: CloudModel.fromJson(json["clouds"]),
      dt: double.parse(json["dt"].toString()),
      sys: SysModel.fromJson(json["sys"]),
      timezone: double.parse(json["timezone"].toString()),
      id: double.parse(json["id"].toString()),
      name: json["name"],
      cod: int.parse(json["cod"].toString()),
    );
  }
//

}

