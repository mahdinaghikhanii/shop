import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SendEmail extends ChangeNotifier {
  final _name = TextEditingController();
  final _subject = TextEditingController();
  final _email = TextEditingController();
  final _message = TextEditingController();

  get nameTextEdit => _name;
  get subjectTextEdit => _subject;
  get emailTextEdit => _email;
  get meesageTextEdit => _message;

  String _responseStatus = '';

  get getStatusCode => _responseStatus;

  Future sendEmail() async {
    final url = Uri.parse('https://api.emailjs.com/api/v1.0/email/send');

    const serviceId = "service_thha95k";
    const templatedID = "template_u19u98f";
    const userId = "XZHT9xJ29pArXSCz2";
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

    print(_response.statusCode);
    _responseStatus = _response.toString();
    return _response.statusCode;
  }
}
