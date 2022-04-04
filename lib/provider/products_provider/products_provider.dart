import 'package:flutter/material.dart';
import 'package:shop/model/products_model.dart';

class ProductsProvider extends ChangeNotifier {
  final List<ProductsModel> _items = [];
  List<ProductsModel> get baskeIteam => _items;

  double _price = 0.0;
  get addcartPrice => _price;

  addProductsCart(ProductsModel productsModel) {
    _items.add(productsModel);
    _price += productsModel.price;
    notifyListeners();
  }

  int get countProducts => _items.length;

  double get totoalPrice => _price;

  removeOneProductsCart(ProductsModel productsModel) {
    _items.remove(productsModel);
    _price -= productsModel.price;
    notifyListeners();
  }
}
