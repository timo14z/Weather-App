import 'package:weatherappquiz/models/DescriptionModel.dart';
import 'package:weatherappquiz/models/WeatherMainModel.dart';
import 'package:weatherappquiz/models/WindModel.dart';

class WeatherModel{
  final double temp;
  final int humidity;
  final double windSpeed;
  final String description;
  final String dtTxt;

  WeatherModel({this.temp, this.humidity, this.windSpeed, this.description, this.dtTxt});

  factory WeatherModel.fromJson(Map<String, dynamic> json){

    WeatherMainModel weatherMainModel = WeatherMainModel.fromJson(json['main']);
    WindModel windModel = WindModel.fromJson(json['wind']);
    DescriptionModel descriptionModel = DescriptionModel.fromJson(json);

    return WeatherModel(
      temp: weatherMainModel.temp,
      humidity: weatherMainModel.humidity,
      windSpeed: windModel.speed,
      description: descriptionModel.description,
      dtTxt: json['dt_txt'],
    );
  }
}
