import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/theme/constant.dart';
import 'package:shop/util/app_provider/app_provider.dart';

class SmallBottomNavigationBar extends StatelessWidget {
  const SmallBottomNavigationBar(
      {Key? key, required this.text, required this.ontap})
      : super(key: key);
  final String text;
  final Function()? ontap;

  @override
  Widget build(BuildContext context) {
    final appProvider = Provider.of<AppProvider>(context);
    return InkWell(
      highlightColor: kwhite,
      onTap: ontap,
      child: Padding(
        padding: const EdgeInsets.all(0.0),
        child: Container(
          height: 25,
          padding: const EdgeInsets.only(left: 8),
          width: 140,
          color: Colors.transparent,
          child: Text(
            text,
            style: TextStyle(
              color: appProvider.brighness ? kwhite : kblackappbar,
              fontSize: 15,
            ),
            textAlign: TextAlign.start,
          ),
        ),
      ),
    );
  }
}
