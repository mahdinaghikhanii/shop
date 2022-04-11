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

  double check = 0;

  addProductsCart(ProductsModel productsModel) async {
    final box = await Hive.openBox<ProductsModel>('dt');
    await Hive.openBox('shopping_box');
    box.add(productsModel);
    final myBox = Hive.box('shopping_box');
    _price += productsModel.price;
    myBox.put('shopping_box', _price);
    notifyListeners();
  }

  getProdcutsCart() async {
    final box = await Hive.openBox<ProductsModel>('dt');
    //final boxPrice = await Hive.openBox('totalPrice');
    _items = box.values.toList();

    notifyListeners();
  }

  getProductCartCount() async {
    await Hive.openBox('shopping_box');
    final box = await Hive.openBox<ProductsModel>('dt');
    _items = box.values.toList();
    _countCart = _items.length;
    //  final myBox = Hive.box('shopping_box');
    // _price = myBox.get('my_key');

    notifyListeners();
  }

  removeOneProductsCart(int index) async {
    final box = Hive.box<ProductsModel>('dt');
    box.deleteAt(index);
    notifyListeners();
  }
}
