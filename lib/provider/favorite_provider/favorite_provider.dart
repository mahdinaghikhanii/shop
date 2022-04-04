import 'package:flutter/foundation.dart';
import 'package:shop/model/products_model.dart';

class FavoriteProvider extends ChangeNotifier {
  final List<ProductsModel> _listfavorite = [];
  List<ProductsModel> get listFavorite => _listfavorite;

  int get countFavorite => _listfavorite.length;

  addFavorite(ProductsModel productsModel) {
    _listfavorite.add(productsModel);
    notifyListeners();
  }

  removeFavorite(ProductsModel productsModel) {
    _listfavorite.remove(productsModel);
    notifyListeners();
  }
}
