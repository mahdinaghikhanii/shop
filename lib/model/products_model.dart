import 'package:shop/model/rating_model.dart';

class ProductsModel {
  ProductsModel(this.id, this.title, this.price, this.description,
      this.catrgory, this.imagee, this.ratingModel);
  final int id;
  final String title;
  final String price;
  final String description;
  final String catrgory;
  final String imagee;

  final RatingModel ratingModel;

  factory ProductsModel.fromJson(Map<String, dynamic> json) => ProductsModel(
        json["id"] as int,
        json["title"] as String,
        // ignore: unnecessary_cast
        json["price"].toString() as String,
        json["description"] as String,
        json["category"] as String,
        json["image"] as String,
        RatingModel.fromJson(json["rating"]),
      );
}
