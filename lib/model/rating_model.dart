import 'package:hive/hive.dart';
part "rating_model.g.dart";

@HiveType(typeId: 1)
class RatingModel extends HiveObject {
  RatingModel({
    required this.rate,
    required this.count,
  });
  @HiveField(0)
  double rate;
  @HiveField(1)
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
