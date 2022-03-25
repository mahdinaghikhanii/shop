import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:shop/model/products_model.dart';
import 'package:shop/model/rating_model.dart';

class Repository extends ChangeNotifier {
  //String url = 'https://fakestoreapi.com/products';
  String url = 'https://fakestoreapi.com/products/category/men\'s clothing';
  // ignore: prefer_final_fields
  List<ProductsModel> _items = [];
  List<ProductsModel> get items => _items;

  List<RatingModel> _rate = [];
  List<RatingModel> get rate => _rate;

  Future featchData() async {
    var respone = await http.get(Uri.parse(url));
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
