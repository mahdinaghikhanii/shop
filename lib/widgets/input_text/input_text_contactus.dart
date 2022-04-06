import 'package:flutter/material.dart';
import 'package:shop/constant.dart';

class InputTextContactUs extends StatelessWidget {
  const InputTextContactUs(
      {Key? key,
      required this.padding,
      required this.hintText,
      required this.labelText,
      required this.contoroller})
      : super(key: key);
  final String labelText;
  final String hintText;
  final double padding;

  final TextEditingController contoroller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(padding),
      child: TextFormField(
          autofocus: false,
          controller: contoroller,
          decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                  borderSide: const BorderSide(color: kyellow)),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25.0),
              ),
              labelText: labelText,
              hintText: hintText,
              hintStyle: Theme.of(context).textTheme.labelMedium,
              labelStyle: Theme.of(context).textTheme.labelMedium)),
    );
  }
}
