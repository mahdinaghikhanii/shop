import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:shop/model/products_model.dart';

class FavoriteProvider with ChangeNotifier {
  final String _favorite = 'favorite';

  List _favoriteList = <ProductsModel>[];
  List get listFavorite => _favoriteList;

  int get countFavorite => _favoriteList.length;

  addFavorite(ProductsModel productsModel) async {
    var box = await Hive.openBox<ProductsModel>(_favorite);
    box.add(productsModel);
    print('added');
    // _listfavorite.add(productsModel);
    notifyListeners();
  }

  getFavorite() async {
    final box = await Hive.openBox<ProductsModel>(_favorite);
    _favoriteList = box.values.toList();
    notifyListeners();
  }

  updateFavorite(int index, ProductsModel productsModel) {
    final box = Hive.box<ProductsModel>(_favorite);
    box.putAt(index, productsModel);
    notifyListeners();
  }

  removeFavorite(int index) async {
    final box = Hive.box<ProductsModel>(_favorite);
    box.delete(index);
    getFavorite();
    notifyListeners();
  }
}
