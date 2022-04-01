import 'package:flutter/material.dart';

class DetailProvider extends ChangeNotifier {
  bool _descTextShowFlag = false;
  get getdescTextShowFlag => _descTextShowFlag;

  setdescTextShowFlag(bool check) {
    _descTextShowFlag = check;
    notifyListeners();
  }
}
