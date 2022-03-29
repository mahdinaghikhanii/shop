import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:shop/model/products_model.dart';

class Repository extends ChangeNotifier {
  int _currentIndexBildChip = 0;
  get currentIndexBuildChip => _currentIndexBildChip;
  setcurrentIndexBuildChip(int index) {
    _currentIndexBildChip = index;
    notifyListeners();
  }

  List url = [
    'https://fakestoreapi.com/products',
    'https://fakestoreapi.com/products/category/men\'s clothing'
  ];
  String allProducts = 'https://fakestoreapi.com/products';
  String menProducts =
      'https://fakestoreapi.com/products/category/men\'s clothing';
  // ignore: prefer_final_fields
  List<ProductsModel> _items = [];
  List<ProductsModel> get items => _items;

  Future featchData() async {
    var respone = await http.get(Uri.parse(allProducts));
    // ignore: unused_local_variable
    List data = jsonDecode(utf8.decode(respone.bodyBytes));
    List<ProductsModel> loadedProduct = [];

    for (int i = 0; i < data.length; i++) {
      var result = ProductsModel.fromJson(data[i]);
      loadedProduct.add(result);
    }
    _items = loadedProduct;

    notifyListeners();
  }
}
