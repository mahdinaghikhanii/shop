import 'package:flutter/material.dart';

import '../../constant.dart';

class SmallButton extends StatelessWidget {
  const SmallButton(
      {Key? key,
      required this.color,
      required this.iconData,
      required this.onTap})
      : super(key: key);
  final IconData iconData;
  final Function() onTap;
  final Color color;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return InkWell(
      onTap: onTap,
      child: Container(
        height: size.height * 0.05,
        width: size.width * 0.09,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: grey),
            color: Colors.transparent),
        child: Icon(
          iconData,
          color: color,
          size: Constans.smallIconSize,
        ),
      ),
    );
  }
}
