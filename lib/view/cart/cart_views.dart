import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/constant.dart';
import 'package:shop/provider/cart_provider/cart_provider.dart';
import 'package:shop/widgets/cart_items/cart_items.dart';

class CartViews extends StatelessWidget {
  const CartViews({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
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
          mainAxisAlignment: cartProvider.countAddCart == 0
              ? MainAxisAlignment.center
              : MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            SizedBox(
              height: 00,
            ),
            // cartProvider.countAddCart == 0
            //   ? const NothingIsHere(text: "You have no\nCart :(") :
            CartItems(),
          ],
        ),
      ),
    );
  }
}
