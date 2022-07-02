import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:shop/model/products_model/products_model.dart';

class FavoriteProvider with ChangeNotifier {
  // final String _favorite = "favorit";

  List _favoriteList = <ProductsModel>[];
  List get listFavorite => _favoriteList;

  int _lenghtFavorite = 0;

  get lenghFavorite => _lenghtFavorite;

  countFavorite() async {
    var box = await Hive.openBox<ProductsModel>('fa');
    _favoriteList = box.values.toList();
    _lenghtFavorite = _favoriteList.length;
    notifyListeners();
  }

  addFavorite(ProductsModel productsModel) async {
    var box = await Hive.openBox<ProductsModel>('fa');
    if (box.containsKey(productsModel.id)) {
      box.delete(productsModel.id);
    } else {
      box.put(productsModel.id, productsModel);
    }
    // box.add(productsModel);
    notifyListeners();
  }

  getFavorite() async {
    final box = await Hive.openBox<ProductsModel>('fa');
    _favoriteList = box.values.toList();
    notifyListeners();
  }

  updateFavorite(int index, ProductsModel productsModel) async {
    final box = Hive.box<ProductsModel>('fa');
    box.putAt(index, productsModel);
    notifyListeners();
  }

  removeFavorite(int index) async {
    final box = Hive.box<ProductsModel>('fa');
    await box.deleteAt(index);
    await getFavorite();
    notifyListeners();
  }
}
