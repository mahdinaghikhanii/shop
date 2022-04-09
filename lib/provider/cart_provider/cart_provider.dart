import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:shop/model/products_model/products_model.dart';

class CartProvider extends ChangeNotifier {
  List _items = <ProductsModel>[];
  List get cartItems => _items;

  int _countCart = 0;
  int get countAddCart => _countCart;

  double get totoalPrice => _price;

  double _price = 0.0;
  get addcartPrice => _price;

  addProductsCart(ProductsModel productsModel) async {
    final box = await Hive.openBox<ProductsModel>('dt');
    box.add(productsModel);
    _price += productsModel.price;
    notifyListeners();
  }

  getProdcutsCart() async {
    final box = await Hive.openBox<ProductsModel>('dt');
    _items = box.values.toList();
    notifyListeners();
  }

  removeOneProductsCart(int index) async {
    final box = Hive.box<ProductsModel>('dt');
    box.deleteAt(index);
    notifyListeners();
  }
}
