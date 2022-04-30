import 'package:appwrite/appwrite.dart';
import 'package:flutter/material.dart';

class AppwriteAuth extends ChangeNotifier {
  Client client = Client()
      .setEndpoint("http://localhost:4003/v1") // Your API Endpoint
      .setProject("626a5244cf1dca4dee63") // Your project ID
      .setSelfSigned(status: true);

  bool _isLoggedIn = false;

  get getIsLogged => _isLoggedIn;

  void singnInUser(String name, String email, String password, account) async {
    try {
      final user =
          await account.create(name: name, email: email, password: password);
      print(user.toString());

      if (user.data == 201) {
        _isLoggedIn = true;
        //_user = await _getAccount();
        notifyListeners();
      }
    } on AppwriteException catch (e) {
      //show message to user or do other operation based on error as required
      print(e.message);
    }
  }
}
