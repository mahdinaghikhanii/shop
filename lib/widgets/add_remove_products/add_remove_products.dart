import 'package:flutter/material.dart';
import 'package:shop/theme/constant.dart';

class AddOrRemoveProducts extends StatelessWidget {
  const AddOrRemoveProducts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          right: Constans.padding, left: Constans.padding, bottom: 10),
      child: SafeArea(
        child: Row(
          children: [
            Container(
              width: 80,
              height: 40,
              decoration: BoxDecoration(color: kyellow),
            )
          ],
        ),
      ),
    );
  }
}
