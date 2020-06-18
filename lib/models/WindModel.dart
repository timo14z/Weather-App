class WindModel{
  final double speed;

  WindModel({this.speed});

  factory WindModel.fromJson(Map<String, dynamic> json){
    return WindModel(
      speed: json['speed'].toDouble(),
    );
  }
}