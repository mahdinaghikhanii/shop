import 'package:cached_network_image/cached_network_image.dart';
import 'package:favorite_button/favorite_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/generated/l10n.dart';
import 'package:shop/provider/cart_provider/cart_provider.dart';
import 'package:shop/constant.dart';
import 'package:shop/provider/favorite_provider/favorite_provider.dart';
import 'package:shop/view/detail/detail_views.dart';
import '../../model/products_model/products_model.dart';
import '../divider_defualt/divider_defualt.dart';

class CartItems extends StatelessWidget {
  static const textPriceStyle = TextStyle(color: grey, fontSize: 14);
  const CartItems({Key? key, l}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var multilanguage = S.of(context);
    final textTheme = Theme.of(context).textTheme;
    final size = MediaQuery.of(context).size;
    return Consumer<CartProvider>(builder: (context, addcart, child) {
      final favoriteProvider = Provider.of<FavoriteProvider>(context);
      context.watch<CartProvider>().getProdcutsCart();

      return Expanded(
        child: ListView.builder(
          itemCount: addcart.cartItems.length,
          itemBuilder: (BuildContext context, int index) {
            ProductsModel cartItems = addcart.cartItems[index];
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
                      bottom: 2),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: size.width * 0.18,
                            height: size.height * 0.13,
                            child: Hero(
                              tag: cartItems.id,
                              child: CachedNetworkImage(
                                imageUrl: cartItems.image,
                              ),
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
                              height: 4,
                            ),
                            Text(
                              cartItems.title,
                              textAlign: TextAlign.left,
                              maxLines: 2,
                              style: textTheme.labelLarge?.copyWith(
                                  fontWeight: FontWeight.bold, fontSize: 15),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 6, bottom: 10),
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
                                  Text(
                                    cartItems.ratingModel.rate.toString(),
                                    style: textTheme.labelLarge
                                        ?.copyWith(fontSize: 15),
                                    textAlign: TextAlign.center,
                                  ),
                                  const Spacer(),
                                  FavoriteButton(
                                    iconSize: 40,
                                    iconDisabledColor: grey,
                                    valueChanged: (_isFavorite) async {
                                      await favoriteProvider.addFavorite(
                                          addcart.cartItems[index]);
                                    },
                                  )
                                ],
                              ),
                            ),
                            Text(
                              "€ " + cartItems.price.toString(),
                              style: textTheme.labelLarge
                                  ?.copyWith(fontSize: 13, color: grey),
                              textAlign: TextAlign.center,
                            ),
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
                          children: [
                            const Icon(
                              Icons.delete,
                              color: grey,
                              size: Constans.mediumsize,
                            ),
                            const SizedBox(
                              width: 4,
                            ),
                            Text(
                              multilanguage.button_RemoveFavorite,
                              style: Constans.textStyleFavoriteAndCartGrayStyle,
                            ),
                          ],
                        ),
                      ),
                      const Spacer(),
                      Text(
                        multilanguage.button_ViewAndBuy,
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
                  height: 10,
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
