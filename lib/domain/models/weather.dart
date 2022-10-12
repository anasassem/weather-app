import 'package:flutter/material.dart';

class WeatherModel{
 int ?id;
 String ?main,description,icon;
 WeatherModel({
  this.id,
  this.main,
  this.description,
  this.icon,
 }); //

 factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      id: int.parse(json["id"].toString()),
      main: json["main"],
      description: json["description"],
      icon: json["icon"],
    );
  }


}