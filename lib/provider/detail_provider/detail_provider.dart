import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:shop/model/products_model/products_model.dart';

class DetailProvider extends ChangeNotifier {
  bool _descTextShowFlag = false;
  get getdescTextShowFlag => _descTextShowFlag;

  setdescTextShowFlag(bool check) {
    _descTextShowFlag = check;
    notifyListeners();
  }
}
