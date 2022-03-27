import 'package:flutter/material.dart';
import 'package:shop/theme/constant.dart';

class InputText extends StatelessWidget {
  const InputText({Key? key, required this.hintText, required this.labelText})
      : super(key: key);
  final String labelText;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return TextField(
        decoration: InputDecoration(
            labelText: labelText,
            hintText: hintText,
            hintStyle: Theme.of(context).textTheme.labelMedium,
            labelStyle: Theme.of(context).textTheme.labelMedium));
  }
}
