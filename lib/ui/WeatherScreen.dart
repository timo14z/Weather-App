import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:weatherappquiz/helpers/UIHelpers.dart';
import 'package:weatherappquiz/models/WeatherModel.dart';

class WeatherScreen extends StatelessWidget {
  WeatherModel weather;

  WeatherScreen(this.weather);



  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return Scaffold(
        body: Container(
            padding: EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: descriptionColor(weather.description)
              ),
            ),
            child:SafeArea(
              child:Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(15),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.pin_drop,
                        size: 28,
                        color: Colors.white,
                      ),
                      Padding(
                        padding: EdgeInsets.all(3),
                      ),
                      Text(
                        "Dubai, UAE",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.all(8),
                  ),
                  Text(DateFormat("EEE, MMM d").format(DateTime.parse(weather.dtTxt)).toString(),
                    style: TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),),
                  Expanded(
                    child: Container(),
                    flex: 1,
                  ),
                  Expanded(
                    child: descriptionImage(weather.description),//descriptionImage(weather.description),
                    flex: 8,
                  ),
                  Expanded(
                    child: Container(),
                    flex: 1,
                  ),
                  Text(weather.temp.toStringAsFixed(2) + " C",
                    style: TextStyle(color: Colors.white, fontSize: 50, fontWeight: FontWeight.bold),),
                  Text(weather.description,
                    style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),),
                  Expanded(
                    child: Container(),
                    flex: 2,
                  ),
                  Text("Humidity : " + weather.humidity.toString(),
                    style: TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),),
                  Text("Wind Speed : " + weather.windSpeed.toStringAsFixed(2),
                    style: TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),),
                  Expanded(
                    child: Container(),
                    flex: 1,
                  )
                ],
              )
            )
        )
    );
  }
}


