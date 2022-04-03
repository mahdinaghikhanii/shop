import 'package:flutter/material.dart';

import 'package:shop/constant.dart';

class ButtonAddcart extends StatelessWidget {
  const ButtonAddcart(
      {Key? key,
      required this.detailBTN,
      required this.ontap,
      required this.price})
      : super(key: key);
  final String detailBTN;
  final Function() ontap;
  final String price;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.only(
          right: Constans.padding, left: Constans.padding, bottom: 10),
      child: SafeArea(
        child: InkWell(
          borderRadius: BorderRadius.circular(20),
          onTap: ontap,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: kyellow,
            ),
            width: double.infinity,
            height: 70,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text("€ " + price + "\nUnit price", style: textTheme.subtitle2),
                Text(
                  detailBTN,
                  style: textTheme.subtitle2,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
