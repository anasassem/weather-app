import 'package:weather_app/api/api_repository.dart';
import 'package:weather_app/domain/models/current_weather_data.dart';
import '../domain/models/five_day_data.dart';

class WeatherService {
  String ?city='cairo';
  String baseUrl = 'https://api.openweathermap.org/data/2.5/';
  String apiKey = 'appid=d3437fae10f93cbd62ba9eef15146c45';

  WeatherService({this.city});

//https://api.openweathermap.org/data/2.5/weather?q=cairo&lang=ar&mode=json&appid=d3437fae10f93cbd62ba9eef15146c45

  void getCurrentWeatherDate(
      {Function()? beforeSend,
      Function(CurrentWeatherData currentWeatherData)? onSuccess,
      required Function(dynamic error) onError}) async {
    final url = '$baseUrl/weather?q=$city&$apiKey';
    Repository(url: url).getData(
      beforeSend: () => beforeSend!(),
      onSuccess: (data) => onSuccess!(CurrentWeatherData.fromJson(data)),
      onError: (error) => onError(error),
    );
  }

  // https://api.openweathermap.org/data/2.5/forecast?q=cairo&mode=json&appid=d3437fae10f93cbd62ba9eef15146c45
  void getFiveDayWeatherDate(
      {Function()? beforeSend,
      Function(List<FiveDayData> fiveDayData)? onSuccess,
      required Function(dynamic error) onError}) async {
    final url = '$baseUrl/forecast?q=$city&$apiKey';
    Repository(url: url).getData(
      beforeSend: () => beforeSend!(),
      onSuccess: (data) =>
      {
        onSuccess!((data['list'] as List).map((element) => FiveDayData.fromJson(element)).toList()
        ),
      },
      onError: (error) => onError(error),
    );
  }
}
