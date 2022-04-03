import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/model/products_model.dart';
import 'package:shop/provider/detail_provider/detail_provider.dart';
import 'package:shop/theme/constant.dart';
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
    final detailsProvider = Provider.of<DetailProvider>(context);
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
          children: [
            const SizedBox(
              height: 30,
            ),
            detailsProvider.currnetindexAddCart == 0
                ? const NothingIsHere(text: "You have no\nCart :(")
                : CartItems(),
          ],
        ),
      ),
    );
  }
}
