import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:weatherappquiz/blocs/WeatherBloc.dart';
import 'package:weatherappquiz/helpers/UIHelpers.dart';
import 'package:weatherappquiz/ui/WeatherScreen.dart';


class MainScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final weatherBloc = BlocProvider.of<WeatherBloc>(context);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return Scaffold(
        body: Container(
          color: Colors.white,
          child:BlocListener<WeatherBloc, WeatherState>(
              listener: (context, state) {
                if (state is WeatherIsLoaded) {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>WeatherScreen(state.getWeather)));
                  weatherBloc.add(ResetState());
                }
              },
              child: SafeArea(
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
                              color: Colors.grey[1000],
                            ),
                            Padding(
                              padding: EdgeInsets.all(3),
                            ),
                            Text(
                              "Dubai, UAE",
                              style: TextStyle(
                                  color: Colors.grey[1000],
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.all(25),
                        ),
                        BlocBuilder<WeatherBloc, WeatherState>(builder: (context, state) {
                          if (state is WeatherIsNotSearched || state is WeatherIsNotLoaded){
                            if(state is WeatherIsNotLoaded)
                              Fluttertoast.showToast(
                                  msg: "Connection Error",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.BOTTOM,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Colors.blue[800],
                                  textColor: Colors.white,
                                  fontSize: 16.0
                              );
                            return Column(
                              children:<Widget>[
                                dayCard(context, Duration(days: 0), weatherBloc),
                                dayCard(context, Duration(days: 1), weatherBloc),
                                dayCard(context, Duration(days: 2), weatherBloc),
                              ],
                            );}
                          return Center(child: CircularProgressIndicator());
                        }
                        )
                      ]))),
        ));
  }
}
