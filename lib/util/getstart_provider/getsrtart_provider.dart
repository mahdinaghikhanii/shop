import 'package:flutter/material.dart';

class GetStartProvider extends ChangeNotifier {
  int _curentIndexGetStart = 0;
  get getCurentIndexGetStart => _curentIndexGetStart;

  setCurentIndexGetStart(int index) {
    _curentIndexGetStart = index;
    notifyListeners();
  }
}
