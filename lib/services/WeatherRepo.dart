import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'dart:convert';

import 'package:weatherappquiz/models/WeatherModel.dart';

class WeatherRepo{


  Future<WeatherModel> getWeather(DateTime dateTime) async{
    final result = await http.Client().get("https://api.openweathermap.org/data/2.5/forecast?id=292223&appid=f7966da285694e76995dd95ff09b3bb2");
    
    if(result.statusCode != 200)
      throw Exception();

    return parsedJson(result.body, dateTime);
  }
  
  WeatherModel parsedJson(final response, DateTime dateTime){
    final jsonDecoded = json.decode(response);

    var list = jsonDecoded['list'] as List;

    List<WeatherModel> weatherList = list.map((i) => WeatherModel.fromJson(i)).toList();

    return processedData(weatherList, dateTime);
  }
}

WeatherModel processedData(List<WeatherModel> weatherList, DateTime dateTime){

  var desiredDate = DateFormat("EEE, MMM d")
      .format(dateTime);

  var weatherMap = weatherList.asMap();
  int sz = weatherList.length;

  /*
    temp is the average temps for all data in the desired date
      same for humidity and wind speed
    description is the description of the first instance of data in the desired date
   */

  double temp = 0.0;
  double windSpeed = 0.0;
  int humidity = 0;
  String description;
  String dtTxt;

  int cnt = 0;

  for(int i=0;i<sz;++i){
    var date = DateFormat("EEE, MMM d")
        .format(DateTime.parse(weatherMap[i].dtTxt));
    if(date == desiredDate){
      ++cnt;
      temp += weatherMap[i].temp;
      humidity += weatherMap[i].humidity;
      windSpeed += weatherMap[i].windSpeed;
      if(cnt == 1) {
        description = weatherMap[i].description;
        dtTxt = weatherMap[i].dtTxt;
      }
    }
  }

  return WeatherModel(temp: temp / cnt - 272.5, humidity: (humidity / cnt).round(), windSpeed: windSpeed / cnt, description: description, dtTxt: dtTxt);
}