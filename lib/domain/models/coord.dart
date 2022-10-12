class CoordModel{
double lat;
double lon;

CoordModel({required this.lat,required this.lon});

factory CoordModel.fromJson(Map<String, dynamic> json) {
    return CoordModel(
      lat: double.parse(json["lat"].toString()),
      lon: double.parse(json["lon"].toString()),
    );
  }
//

}

