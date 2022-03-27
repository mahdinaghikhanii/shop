import 'package:flutter/material.dart';
import 'package:shop/theme/constant.dart';

class SmallBottomNavigationBar extends StatelessWidget {
  const SmallBottomNavigationBar({Key? key, required this.text})
      : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0.0),
      child: Container(
        height: 50,
        width: 120,
        color: Colors.transparent,
        child: Center(
            child: Text(
          text,
          style: Theme.of(context).textTheme.bodyText2,
        )),
      ),
    );
  }
}
