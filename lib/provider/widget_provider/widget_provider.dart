import 'package:flutter/material.dart';

class WidgetProvider extends ChangeNotifier {
  bool _showCircularProgressIndicatorInReq = false;

  get getshowCircularProgressIndicator => _showCircularProgressIndicatorInReq;

  void loading() {
    _showCircularProgressIndicatorInReq = !_showCircularProgressIndicatorInReq;
  }
}
