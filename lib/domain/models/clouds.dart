class CloudModel{
  double ?all;

  CloudModel({
    this.all,
  });

  factory CloudModel.fromJson(Map<String, dynamic> json) {
    return CloudModel(
      all: double.parse(json["all"].toString()),
    );
  }
//

}