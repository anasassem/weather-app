class MainWeatherModel {
  double? temp, feels_like, temp_min, temp_max, pressure, humidity;

  MainWeatherModel({
    this.temp,
    this.feels_like,
    this.temp_min,
    this.temp_max,
    this.pressure,
    this.humidity,
  });

  factory MainWeatherModel.fromJson(Map<String, dynamic> json) {
    return MainWeatherModel(
      temp: double.parse(json["temp"].toString()),
      feels_like: json["feels_like"].toDouble(),
      temp_min: json["temp_min"].toDouble(),
      temp_max: json["temp_max"].toDouble(),
      pressure: json["pressure"].toDouble(),
      humidity: json["humidity"].toDouble(),
    );
  }
//

}
