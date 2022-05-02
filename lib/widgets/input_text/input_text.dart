import 'package:flutter/material.dart';

class InputText extends StatelessWidget {
  const InputText(
      {Key? key,
      required this.padding,
      required this.hintText,
      required this.validator,
      required this.labelText,
      required this.contoroller})
      : super(key: key);
  final String labelText;
  final String hintText;
  final double padding;
  final validator;

  final TextEditingController contoroller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(padding),
      child: TextFormField(
          autofocus: false,
          validator: validator,
          controller: contoroller,
          decoration: InputDecoration(
              labelText: labelText,
              hintText: hintText,
              hintStyle: Theme.of(context).textTheme.labelMedium,
              labelStyle: Theme.of(context).textTheme.labelMedium)),
    );
  }
}
