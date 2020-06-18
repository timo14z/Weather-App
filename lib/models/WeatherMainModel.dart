class WeatherMainModel{
  final double temp;
  final int humidity;

  WeatherMainModel({this.temp, this.humidity});

  factory WeatherMainModel.fromJson(Map<String, dynamic> json){
    return WeatherMainModel(
      temp: json['temp'].toDouble(),
      humidity: json['humidity']
    );
  }
}