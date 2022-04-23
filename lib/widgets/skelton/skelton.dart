import 'package:flutter/material.dart';

class Skelton extends StatelessWidget {
  const Skelton({Key? key, required this.height, required this.width})
      : super(key: key);
  final double height, width;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.04),
          borderRadius: const BorderRadius.all(Radius.circular(16))),
    );
  }
}
