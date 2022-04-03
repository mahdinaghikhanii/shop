import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/main.dart';
import 'package:shop/provider/products_provider/products_provider.dart';
import 'package:shop/constant.dart';
import 'package:shop/view/detail/detail_views.dart';
import 'package:shop/widgets/add_remove_products_btn_cart/add_remove_products_btn_cart.dart';

class CartItems extends StatelessWidget {
  static const textPriceStyle = TextStyle(color: grey, fontSize: 14);
  const CartItems({Key? key, l}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
            return GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DetailViews(
                              productsModel: cart.baskeIteam[index],
                            )));
              },
              child: Padding(
                padding: const EdgeInsets.only(
                    left: Constans.padding,
                    right: Constans.padding,
                    top: Constans.padding,
                    bottom: 5),
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
                            height: 8,
                          ),
                          Text("€ " + cart.baskeIteam[index].price.toString()),
                          const SizedBox(
                            height: Constans.smallSizedBox,
                          ),
                          AddRemoveProductsButtonCart(
                            productsModel: cart.baskeIteam[index],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        ),
      );
    });
  }
}
