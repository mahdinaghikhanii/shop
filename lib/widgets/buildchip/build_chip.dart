import 'package:flutter/material.dart';
import 'package:shop/theme/constant.dart';

class BuildChip extends StatelessWidget {
  const BuildChip({Key? key, required this.color, required this.text})
      : super(key: key);
  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10, top: 20),
      child: FilterChip(
        label: Text(
          text,
          style: const TextStyle(
            color: kblack,
          ),
        ),
        backgroundColor: kwhite,
        elevation: 6.0,
        shadowColor: Colors.grey[60],
        padding: const EdgeInsets.all(11.0),
        onSelected: (bool value) {},
      ),
    );
  }
}
