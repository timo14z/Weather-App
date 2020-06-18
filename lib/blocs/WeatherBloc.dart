import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:weatherappquiz/models/WeatherModel.dart';
import 'package:weatherappquiz/services/WeatherRepo.dart';

class WeatherEvent extends Equatable{
  @override
  // TODO: implement props
  List<Object> get props => [];

}

class ResetState extends WeatherEvent{

  ResetState();

  @override
  // TODO: implement props
  List<Object> get props => [];
}

class FetchWeather extends WeatherEvent{

  final _duration;

  FetchWeather(this._duration);

  @override
  // TODO: implement props
  List<Object> get props => [_duration];
}


class WeatherState extends Equatable{
  @override
  // TODO: implement props
  List<Object> get props => [];

}


class WeatherIsNotSearched extends WeatherState{

}

class WeatherIsLoading extends WeatherState{

}

class WeatherIsLoaded extends WeatherState{
  final _weather;

  WeatherIsLoaded(this._weather);

  WeatherModel get getWeather => _weather;

  @override
  // TODO: implement props
  List<Object> get props => [_weather];
}

class WeatherIsNotLoaded extends WeatherState{

}

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {

  WeatherRepo weatherRepo;

  WeatherBloc(this.weatherRepo);

  @override
  WeatherState get initialState => WeatherIsNotSearched();

  @override
  Stream<WeatherState> mapEventToState(WeatherEvent event) async* {
    if (event is FetchWeather) {
      yield WeatherIsLoading();

      try {
        WeatherModel weather = await weatherRepo.getWeather(event._duration);
        yield WeatherIsLoaded(weather);
      } catch (_) {
        print(_);
        yield WeatherIsNotLoaded();
      }
    }
    else if(event is ResetState) {
      yield this.initialState;
    }
  }
}
