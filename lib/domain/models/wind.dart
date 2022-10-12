class WindModel{
  double ?speed,deg;

  WindModel({
    this.speed,
    this.deg,
  });

  factory WindModel.fromJson(Map<String, dynamic> json) {
    return WindModel(
      speed: double.parse(json["speed"].toString()),
      deg: json["deg"].toDouble(),
    );
  }
//

}