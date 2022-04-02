import 'package:shop/model/rating_model.dart';

class ProductsModel {
  ProductsModel(this.id, this.title, this.price, this.description,
      this.catrgory, this.image, this.ratingModel);
  final int id;
  final String title;
  final double price;
  final String description;
  final String catrgory;
  final String image;

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
}
