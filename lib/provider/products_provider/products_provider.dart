import 'package:flutter/material.dart';
import 'package:shop/model/products_model.dart';

class ProductsProvider extends ChangeNotifier {
  final List<ProductsModel> _lst = [];
  get cartlist => _lst;
  double _price = 0.0;
  get addcartPrice => _price;
  add(ProductsModel productsModel) {
    _lst.add(productsModel);
    _price += productsModel.price;
    notifyListeners();
  }

  remove(int index) {
    _lst.removeAt(index);
    notifyListeners();
  }
}
