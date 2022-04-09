import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/main.dart';
import 'package:shop/provider/cart_provider/cart_provider.dart';
import 'package:shop/constant.dart';
import 'package:shop/view/detail/detail_views.dart';
import '../../model/products_model/products_model.dart';
import '../divider_defualt/divider_defualt.dart';

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
    return Consumer<CartProvider>(builder: (context, addcart, child) {
      context.watch<CartProvider>().getProdcutsCart();
      return Expanded(
        child: ListView.builder(
          itemCount: addcart.cartItems.length,
          itemBuilder: (BuildContext context, int index) {
            ProductsModel fav = addcart.cartItems[index];
            return GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DetailViews(
                              productsModel: addcart.cartItems[index],
                            )));
              },
              child: Column(children: [
                Padding(
                  padding: const EdgeInsets.only(
                      left: Constans.padding,
                      right: Constans.padding,
                      top: 10,
                      bottom: 5),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: size.width * 0.20,
                            height: size.height * 0.16,
                            child: CachedNetworkImage(
                              imageUrl: fav.image,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 10,
                            ),
                            Text(fav.title,
                                textAlign: TextAlign.left,
                                maxLines: 2,
                                style: textTitleStyle),
                            Padding(
                              padding: const EdgeInsets.only(top: 6, bottom: 8),
                              child: Row(
                                children: [
                                  const Icon(
                                    Icons.star_rate,
                                    size: Constans.smallIconSize,
                                    color: kyellow,
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Text(fav.ratingModel.rate.toString()),
                                ],
                              ),
                            ),
                            Text("€ " + fav.price.toString()),
                            const SizedBox(
                              height: Constans.smallSizedBox,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: Constans.padding, right: Constans.padding),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      InkWell(
                        highlightColor: kyellow,
                        borderRadius:
                            BorderRadius.circular(Constans.smallBorderRadios),
                        onTap: () {
                          addcart.removeOneProductsCart(index);
                        },
                        child: Row(
                          children: const [
                            Icon(
                              Icons.delete,
                              color: grey,
                              size: Constans.mediumsize,
                            ),
                            SizedBox(
                              width: 4,
                            ),
                            Text(
                              'Remove cart',
                              style: Constans.textStyleFavoriteAndCartGrayStyle,
                            ),
                          ],
                        ),
                      ),
                      const Spacer(),
                      const Text(
                        'View details',
                        style: Constans.textStyleFavoriteViewAndBuy,
                      ),
                      const Icon(
                        Icons.keyboard_arrow_right,
                        color: kyellow,
                        size: Constans.mediumsize,
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                const DivderDefualt(),
              ]),
            );
          },
        ),
      );
    });
  }
}
