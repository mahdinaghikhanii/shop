import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:shop/model/products_model/products_model.dart';
import 'package:shop/widgets/erorr/erorr.dart';

class Repository extends ChangeNotifier {
  int _currentIndexBildChip = 0;
  get currentIndexBuildChip => _currentIndexBildChip;

  setcurrentIndexBuildChip(int index, bool check) {
    _currentIndexBildChip = index;
    notifyListeners();
  }

  int _statuCode = 0;
  int get getStatusCode => _statuCode;

// first url req for all Products  url 2 for men products url 3 womens and 4 jewelery

  List url = [
    'https://fakestoreapi.com/products',
    'https://fakestoreapi.com/products/category/men\'s clothing',
    'https://fakestoreapi.com/products/category/women\'s clothing',
    'https://fakestoreapi.com/products/category/jewelery'
  ];
  String allProducts = 'https://fakestoreapi.com/products';
  String menProducts =
      'https://fakestoreapi.com/products/category/men\'s clothing';
  // ignore: prefer_final_fields
  List<ProductsModel> _items = [];
  List<ProductsModel> get items => _items;

  Future featchData() async {
    var respone = await http.get(Uri.parse(url[_currentIndexBildChip]));
    // ignore: unused_local_variable
    List data = jsonDecode(utf8.decode(respone.bodyBytes));
    _statuCode = respone.statusCode;
    print("this is status code" + _statuCode.toString());
    List<ProductsModel> loadedProduct = [];

    for (int i = 0; i < data.length; i++) {
      var result = ProductsModel.fromJson(data[i]);
      loadedProduct.add(result);
    }
    if (respone.statusCode == 200) {
      notifyListeners();
      return _items = loadedProduct;
    } else {
      return Erorr();
    }
  }
}
