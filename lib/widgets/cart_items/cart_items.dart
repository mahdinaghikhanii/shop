import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/main.dart';
import 'package:shop/provider/products_provider/products_provider.dart';
import 'package:shop/constant.dart';

class CartItems extends StatelessWidget {
  const CartItems({Key? key, l}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textPriceStyle = const TextStyle(color: grey, fontSize: 14);
    final textTitleStyle = TextStyle(
        color: appProvider.brighness ? kwhite : kblackappbar,
        fontSize: 14,
        fontWeight: FontWeight.w500);
    final size = MediaQuery.of(context).size;
    return Consumer<ProductsProvider>(builder: (context, cart, child) {
      return Expanded(
        child: ListView.builder(
          itemCount: cart.baskeIteam.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.all(Constans.padding),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: size.width * 0.24,
                    height: size.height * 0.16,
                    child: CachedNetworkImage(
                      imageUrl: cart.baskeIteam[index].image,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(cart.baskeIteam[index].title,
                            textAlign: TextAlign.left,
                            maxLines: 2,
                            style: textTitleStyle),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(cart.baskeIteam[index].price.toString())
                      ],
                    ),
                  )
                ],
              ),
            );
          },
        ),
      );
    });
  }
}
