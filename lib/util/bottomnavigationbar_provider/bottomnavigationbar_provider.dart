import 'package:flutter/material.dart';

class BottomNavigationBarProvider extends ChangeNotifier {
  int _currentIndex = 0;
  get currentIndex => _currentIndex;
  setcurrentIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }
}
