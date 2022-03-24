// ignore_for_file: constant_identifier_names
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppProvider extends ChangeNotifier {
  var theme = ThemeData.light();
  bool _brightness = false;
  static const THEME_STATUS = "THEMESTATUS";

  bool get brighness => _brightness;
  set brightnessChange(bool checkbrightness) {
    _brightness = checkbrightness;
    setDarkThemeOrLightTheme(checkbrightness);
    notifyListeners();
  }

  setDarkThemeOrLightTheme(bool value) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setBool(THEME_STATUS, value);
  }

  getDarkThemeOrLightTheme() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    if (sharedPreferences.getBool(THEME_STATUS) == null) {
      _brightness = false;
    } else {
      _brightness = sharedPreferences.getBool(THEME_STATUS) ?? false;
    }
  }
}
