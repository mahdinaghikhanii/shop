import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {
  double get width => MediaQuery.of(this).size.width;
  double get height => MediaQuery.of(this).size.height;

  Future<void> nextViews(Widget child) {
    return Navigator.push(this, MaterialPageRoute(builder: (context) => child));
  }
}
