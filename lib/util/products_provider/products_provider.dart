import 'package:flutter/material.dart';
import 'package:shop/model/products_model.dart';
import 'package:shop/model/rating_model.dart';

class ProductsProvider extends ChangeNotifier {
  List<ProductsModel> _lst = [];
  get cartlist => _lst;
  add(String image, String title, int id, String price, String description,
      String catrgory, RatingModel ratingModel) {
    _lst.add(ProductsModel(
        id, title, price, description, catrgory, image, ratingModel));
    notifyListeners();
  }

  remove(int index) {
    _lst.removeAt(index);
    notifyListeners();
  }
}
