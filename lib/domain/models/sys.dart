class SysModel {
  int? type, id;
  String? country;
  int? sunrise;
  int? sunset;

  SysModel({
    this.type,
    this.id,
    this.country,
    this.sunrise,
    this.sunset,
  });

  factory SysModel.fromJson(Map<String, dynamic> json) {
    return SysModel(
      type: int.tryParse(json["type"].toString())?? -1,
      id:  int.tryParse(json["id"].toString())??-1,
      country: json["country"],
      sunrise: int.parse(json["sunrise"].toString()),
      sunset: int.parse(json["sunset"].toString()),
    );
  }
//
}
