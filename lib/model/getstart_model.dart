import 'package:flutter/material.dart';

class GetStartModel {
  String title;
  String img;
  Color color;
  Function() ontap;
  GetStartModel(
      {required this.color,
      required this.img,
      required this.ontap,
      required this.title});
}
