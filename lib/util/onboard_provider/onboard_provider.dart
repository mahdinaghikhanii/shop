import 'package:flutter/material.dart';

class OnBoardProvider extends ChangeNotifier {
  int _curentIndexOnBoard = 0;
  get getCurentIndexOnBoard => _curentIndexOnBoard;

  setCurentIndexGetStart(int index) {
    _curentIndexOnBoard = index;
    notifyListeners();
  }
}
