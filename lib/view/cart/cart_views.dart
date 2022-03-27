import 'package:flutter/material.dart';
import 'package:shop/theme/constant.dart';
import 'package:shop/widgets/nothing_is_here/nothing_is_here.dart';

class CartViews extends StatelessWidget {
  const CartViews({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0,
          leadingWidth: 120,
          leading: Padding(
            padding: const EdgeInsets.only(left: Constans.padding, top: 20),
            child: Text(
              'Cart',
              style: Theme.of(context).textTheme.subtitle1,
            ),
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            SizedBox(
              height: 30,
            ),
            NothingIsHere(
              text: "You have no\nCart :(",
            ),
          ],
        ),
      ),
    );
  }
}
