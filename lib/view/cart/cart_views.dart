import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/constant.dart';
import 'package:shop/widgets/cart_items/cart_items.dart';
import 'package:shop/widgets/nothing_is_here/nothing_is_here.dart';

import '../../provider/products_provider/products_provider.dart';

class CartViews extends StatelessWidget {
  const CartViews({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductsProvider>(context);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0,
          leadingWidth: 120,
          leading: Padding(
            padding: const EdgeInsets.only(left: Constans.padding, top: 20),
            child: Text(
              'My Cart',
              style: Theme.of(context).textTheme.subtitle1,
            ),
          ),
        ),
        body: Column(
          mainAxisAlignment: productProvider.countProducts == 0
              ? MainAxisAlignment.center
              : MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 00,
            ),
            productProvider.countProducts == 0
                ? const NothingIsHere(text: "You have no\nCart :(")
                : const CartItems(),
          ],
        ),
      ),
    );
  }
}
