import 'package:appwrite/appwrite.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppwriteAuth extends ChangeNotifier {
  final String LOGIN_STATUS = 'STATUSLOGIN';

  Client client = Client()
      .setEndpoint("http://localhost:4003/v1") // Your API Endpoint
      .setProject("626a5244cf1dca4dee63") // Your project ID
      .setSelfSigned(status: true);

  bool _isLoggedIn = false;

  get getIsLogged => _isLoggedIn;

  void setsSaveSignInAndSignUp(bool check, String name) {
    _isLoggedIn = check;
    saveSignInAndSignUp(check, name);
    notifyListeners();
  }

  void saveSignInAndSignUp(bool check, String name) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setBool(LOGIN_STATUS, check);
    sharedPreferences.setString(LOGIN_STATUS, name);
  }

  void getsaveSignInAndSignUp() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    if (sharedPreferences.getBool(LOGIN_STATUS) == null) {
      _isLoggedIn = false;
    } else {
      _isLoggedIn = sharedPreferences.getBool(LOGIN_STATUS) ?? false;
    }
  }
}
