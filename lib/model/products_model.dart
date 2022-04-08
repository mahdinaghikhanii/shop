import 'package:hive/hive.dart';
import 'package:shop/model/rating_model.dart';

part 'products_model.g.dart';

@HiveType(typeId: 0)
class ProductsModel extends HiveObject {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final String title;

  @HiveField(2)
  final double price;

  @HiveField(3)
  final String description;

  @HiveField(4)
  final String catrgory;

  @HiveField(5)
  final String image;

  @HiveField(6)
  final RatingModel ratingModel;

  factory ProductsModel.fromJson(Map<String, dynamic> json) => ProductsModel(
        json["id"] as int,
        json["title"] as String,
        // ignore: unnecessary_cast
        json["price"].toDouble() as double,
        json["description"] as String,
        json["category"] as String,
        json["image"] as String,
        RatingModel.fromJson(json["rating"]),
      );

  ProductsModel(this.id, this.title, this.price, this.description,
      this.catrgory, this.image, this.ratingModel);
}
