import 'package:flutter/material.dart';

class InputText extends StatelessWidget {
  const InputText(
      {Key? key,
      required this.hintText,
      required this.labelText,
      required this.contoroller})
      : super(key: key);
  final String labelText;
  final String hintText;
  final TextEditingController contoroller;

  @override
  Widget build(BuildContext context) {
    return TextField(
        controller: contoroller,
        decoration: InputDecoration(
            labelText: labelText,
            hintText: hintText,
            hintStyle: Theme.of(context).textTheme.labelMedium,
            labelStyle: Theme.of(context).textTheme.labelMedium));
  }
}
