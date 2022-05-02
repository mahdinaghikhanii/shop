// ignore_for_file: non_constant_identifier_names

import 'package:appwrite/appwrite.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppwriteAuth extends ChangeNotifier {
  //this part for connected appwrite Server

  Client client = Client()
      .setEndpoint("http://localhost:4003/v1") // Your API Endpoint
      .setProject("626a5244cf1dca4dee63") // Your project ID
      .setSelfSigned(status: true);

  final String LOGIN_CHECK = 'LOGINCHECK';

  final String LOGIN_USERNAME = 'LOGINUSERNAME';

  bool _isLoggedIn = false;
  String _username = 'true';

  get getIsLogged => _isLoggedIn;

  void setsSaveSignInAndSignUp(bool check, String name) {
    _isLoggedIn = check;
    _username = name;
    saveSignInAndSignUp(check, name);
    notifyListeners();
  }

  void saveSignInAndSignUp(bool check, String name) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setBool(LOGIN_CHECK, check);
    await sharedPreferences.setString(LOGIN_USERNAME, name);
  }

  getDarkThemeOrLightTheme() async {}

  Future logOutAccount() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return await sharedPreferences.remove(LOGIN_CHECK);
  }

  getsaveSignInAndSignUp() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    if (sharedPreferences.getBool(LOGIN_CHECK) == null &&
        sharedPreferences.getString(LOGIN_USERNAME) == '') {
      _isLoggedIn = false;
      _username = '';
    } else {
      _username = sharedPreferences.getString(LOGIN_USERNAME) ?? '';
      _isLoggedIn = sharedPreferences.getBool(LOGIN_CHECK) ?? false;
    }
  }
}
