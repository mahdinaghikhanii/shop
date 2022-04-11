// ignore_for_file: constant_identifier_names
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppProvider extends ChangeNotifier {
  var theme = ThemeData.light();
  bool _brightness = false;

  static const THEME_STATUS = "THEMESTATUS";
  static const LANGUAGE_CODE = "LANGUAGECODE";

  bool get brighness => _brightness;

  //change Appearance application DARK AND LIGHT
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

  // this application just support LANGUAGE PERSIAN AND ENGLISH
  //and this part change  language
  Locale _currentLocale = const Locale('en');
  Locale get language => _currentLocale;

  fetchLocale() async {
    var perfs = await SharedPreferences.getInstance();
    if (perfs.getString(LANGUAGE_CODE) == null) {
      return _currentLocale = const Locale("en");
    } else {
      return _currentLocale = Locale(perfs.getString(LANGUAGE_CODE).toString());
    }
  }

  void setLanguage(String typ) async {
    var perfs = await SharedPreferences.getInstance();
    if (_currentLocale == Locale(typ.toString())) {
      return;
    }

    if (Locale(typ.toString()) == const Locale('fa')) {
      _currentLocale = const Locale("fa");
      await perfs.setString(LANGUAGE_CODE, 'fa');
    } else {
      _currentLocale = const Locale('en');
      await perfs.setString(LANGUAGE_CODE, 'en');
    }
    notifyListeners();
  }
}
