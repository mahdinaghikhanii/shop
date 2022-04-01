import 'package:flutter/material.dart';
import 'package:shop/theme/constant.dart';

class ButtonAddcart extends StatelessWidget {
  const ButtonAddcart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.only(
          right: Constans.padding, left: Constans.padding, bottom: 10),
      child: SafeArea(
        child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: kyellow,
            ),
            width: double.infinity,
            height: 60,
            child: Center(
                child: Text(
              'Add Cart',
              style: textTheme.subtitle2,
            ))),
      ),
    );
  }
}
