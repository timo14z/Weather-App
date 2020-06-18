class DescriptionModel{
  final description;

  DescriptionModel({this.description});

  factory DescriptionModel.fromJson(Map<String, dynamic> json){
    var list = json['weather'] as List;
    List<DescriptionM> descriptionList = list.map((i) => DescriptionM.fromJson(i)).toList();
    return DescriptionModel(
      description: descriptionList.first.description,
    );
  }
}

class DescriptionM{
  final description;

  DescriptionM({this.description});

  factory DescriptionM.fromJson(Map<String, dynamic> json){
    return DescriptionM(
      description: json['description'],
    );
  }
}
