class RatingModel {
  RatingModel({
    required this.rate,
    required this.count,
  });

  double rate;
  int count;

  factory RatingModel.fromJson(Map<String, dynamic> json) => RatingModel(
        rate: json["rate"].toDouble() as double,
        count: json["count"] as int,
      );

  Map<String, dynamic> toJson() => {
        "rate": rate,
        "count": count,
      };
}
