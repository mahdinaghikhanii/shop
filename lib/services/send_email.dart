import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SendEmail extends ChangeNotifier {
  bool _checkTextEdit = false;
  get getcheckTextEdit => _checkTextEdit;

  final _name = TextEditingController();
  final _subject = TextEditingController();
  final _email = TextEditingController();
  final _message = TextEditingController();

  get nameTextEdit => _name;
  get subjectTextEdit => _subject;
  get emailTextEdit => _email;
  get meesageTextEdit => _message;

  void clearTextEdit() {
    _name.clear();
    _subject.clear();
    _email.clear();
    _message.clear();
    _checkTextEdit = false;
  }

  int _statusCodes = 0;
  setStatusCode(int number) {
    _statusCodes = number;
    notifyListeners();
  }

  get getStatusCode => _statusCodes;

  bool _showCircularProgressIndicator = false;
  get getshowCircularProgressIndicator => _showCircularProgressIndicator;

  Future sendEmail() async {
    final url = Uri.parse('https://api.emailjs.com/api/v1.0/email/send');

    const serviceId = "service_thha95k";
    const templatedID = "template_u19u98f";
    const userId = "XZHT9xJ29pArXSCz2";
    if (_name.text.isEmpty &
        _subject.text.isEmpty &
        _email.text.isEmpty &
        _message.text.isEmpty) {
      _checkTextEdit = true;

      notifyListeners();
      return null;
    } else {
      _showCircularProgressIndicator = true;
      _checkTextEdit = false;
      notifyListeners();
      final _response = await http.post(url,
          headers: {
            'origin': 'http://localhost',
            'Content-Type': 'application/json'
          },
          body: json.encode({
            "service_id": serviceId,
            "template_id": templatedID,
            "user_id": userId,
            "template_params": {
              "name": _name.text,
              "subject": _subject.text,
              "user_email": _email.text,
              "message": _message.text,
            }
          }));

      if (_response.statusCode == 200) {
        _statusCodes = _response.statusCode;
        _showCircularProgressIndicator = false;
        clearTextEdit();
        notifyListeners();
        return _response.statusCode;
      } else {
        _statusCodes = _response.statusCode;
        _showCircularProgressIndicator = false;

        notifyListeners();
        return false;
      }
    }
  }
}
