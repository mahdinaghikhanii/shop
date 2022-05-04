// ignore_for_file: non_constant_identifier_names

import 'dart:developer';
import 'package:appwrite/appwrite.dart';

import 'package:appwrite/models.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shop/routes/routes.dart';

class AppwriteAuth extends ChangeNotifier {
  late Account account;
  //this part for connected appwrite Server
  Client client = Client()
      .setEndpoint("http://localhost:4003/v1") // Your API Endpoint
      .setProject("626a5244cf1dca4dee63") // Your project ID
      .setSelfSigned(status: true);

  final String LOGIN_CHECK = 'LOGINCHECK';
  final String LOGIN_USERNAME = 'LOGINUSERNAME';

  //check login is login or not
  bool _isLoggedIn = false;

  get getIsLogged => _isLoggedIn;

  // user login name
  String _username = '';
  get getUserName => _username;

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

  Future logOutAccount() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return await sharedPreferences.remove(LOGIN_CHECK) &&
        await sharedPreferences.remove(LOGIN_CHECK);
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

  Future<User?> getAccount() async {
    try {
      return await account.get();
    } on AppwriteException catch (e) {
      log(e.toString());
      return null;
    }
  }

  // A function to login the user with email and password
  Future<void> login(
      String email, String password, BuildContext context) async {
    try {
      await account.createSession(email: email, password: password);

      await Navigator.pushReplacementNamed(context, RouteManager.homeViews);
    } catch (e) {
      // print(e);
      await showDialog(
          context: context,
          builder: (BuildContext context) => AlertDialog(
                title: const Text('Error Occured'),
                content: Text(e.toString()),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text("Ok"))
                ],
              ));
    }
  }

  ///  A function to signup the user with email and password
  Future<void> signUp(
      String email, String password, BuildContext context) async {
    try {
      await account.create(
          email: email, password: password, userId: 'unique()');
      // We will creating a userId as the email id(UNIQUE)

      await account.createSession(email: email, password: password);

      await Navigator.pushReplacementNamed(context, RouteManager.homeViews);
    } catch (e) {
      log(" Sign Up $e");
      await showDialog(
          context: context,
          builder: (BuildContext context) => AlertDialog(
                title: const Text('Error Occured'),
                content: Text(e.toString()),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text("Ok"))
                ],
              ));
    }
  }

  ///  A function to logout the current user
  Future<void> logout(BuildContext context) async {
    try {
      ///  Delete session is the method to logout the user
      ///  it expects sessionID but by passing 'current' it redirects to
      ///  current loggedIn user in this application
      await account.deleteSession(sessionId: 'current');
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Logged out Successfully"),
        duration: Duration(seconds: 2),
      ));
      await Navigator.of(context).pushReplacementNamed(RouteManager.homeViews);
    } catch (e) {
      // print(e);
      await showDialog(
          context: context,
          builder: (BuildContext context) => AlertDialog(
                title: const Text('Something went wrong'),
                content: Text(e.toString()),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text("Ok"))
                ],
              ));
    }
  }
}
