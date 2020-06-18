import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weatherappquiz/blocs/WeatherBloc.dart';

Widget dayCard(BuildContext context, Duration duration, WeatherBloc weatherBloc) {
  return Container(
    width: MediaQuery.of(context).size.width,
    height: 70,
    decoration: BoxDecoration(
        color: Colors.blue[800], borderRadius: BorderRadius.circular(10.0)),
    margin: EdgeInsets.all(10),
    child: FlatButton(
      onPressed: (){
        weatherBloc.add(FetchWeather(DateTime.now().add(duration)));
      },
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Text(
        DateFormat("EEE, MMM d")
            .format(DateTime.now().add(duration))
            .toString(),
        style: TextStyle(
            color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
      ),
    ),
  );
}

Image descriptionImage(String description){
  if(description.contains("rain"))
    return Image.asset('images/rain.png');
  if(description.contains("cloud"))
    return Image.asset('images/clouds.png');
  return Image.asset('images/sun.png');
}

List<Color> descriptionColor(String description){
  if(description.contains("rain"))
    return [Color.fromRGBO(5, 20, 42, 1), Color.fromRGBO(37, 80, 138, 1)];
  if(description.contains("cloud"))
    return [Color.fromRGBO(24, 76, 145, 1), Color.fromRGBO(82, 135, 207, 1)];
  return [Color.fromRGBO(20, 111, 145, 1), Color.fromRGBO(100, 184, 220, 1)];
}
