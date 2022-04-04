import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/constant.dart';
import 'package:shop/main.dart';
import 'package:shop/provider/products_provider/products_provider.dart';
import 'package:shop/view/detail/detail_views.dart';
import 'package:shop/widgets/divider_defualt/divider_defualt.dart';

class FavoriteItems extends StatelessWidget {
  const FavoriteItems({Key? key}) : super(key: key);

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
                              imageUrl: cart.baskeIteam[index].image,
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
                            Text(cart.baskeIteam[index].title,
                                textAlign: TextAlign.left,
                                maxLines: 2,
                                style: textTitleStyle),
                            const SizedBox(
                              height: 8,
                            ),
                            Text(
                                "€ " + cart.baskeIteam[index].price.toString()),
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
                        child: Row(
                          children: [
                            Icon(
                              Icons.delete,
                              color: grey,
                              size: 24,
                            ),
                            SizedBox(
                              width: 4,
                            ),
                            Text(
                              'Remove favorite',
                              style: Constans.textStyleFavoriteAndCartGrayStyle,
                            ),
                          ],
                        ),
                      ),
                      Spacer(),
                      Text(
                        'View and buy',
                        style: Constans.textStyleFavoriteViewAndBuy,
                      ),
                      Icon(
                        Icons.keyboard_arrow_right,
                        color: kyellow,
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
