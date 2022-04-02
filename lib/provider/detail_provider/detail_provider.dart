import 'package:flutter/material.dart';

class DetailProvider extends ChangeNotifier {
  bool _descTextShowFlag = false;
  get getdescTextShowFlag => _descTextShowFlag;

  setdescTextShowFlag(bool check) {
    _descTextShowFlag = check;
    notifyListeners();
  }

// here for btn detail Add cart or remove
  int _currentIndexAddCart = 0;
  get currnetindexAddCart => _currentIndexAddCart;

  setcurrentIndeXAddCart(int index) {
    _currentIndexAddCart = index;
    notifyListeners();
  }

  addinAddCart() {
    _currentIndexAddCart++;
    notifyListeners();
  }

  removeinAddcart() {
    _currentIndexAddCart--;
    notifyListeners();
  }
}
