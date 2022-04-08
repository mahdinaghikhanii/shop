import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/constant.dart';
import 'package:shop/main.dart';
import 'package:shop/model/products_model.dart';
import 'package:shop/provider/favorite_provider/favorite_provider.dart';
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
    return Consumer<FavoriteProvider>(builder: (context, favorite, child) {
      context.watch<FavoriteProvider>().getFavorite();
      return Expanded(
        child: ListView.builder(
          itemCount: favorite.listFavorite.length,
          itemBuilder: (BuildContext context, int index) {
            ProductsModel fav = favorite.listFavorite[index];
            return GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DetailViews(
                              productsModel: favorite.listFavorite[index],
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
                          favorite.removeFavorite(favorite.listFavorite[index]);
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
                              'Remove favorite',
                              style: Constans.textStyleFavoriteAndCartGrayStyle,
                            ),
                          ],
                        ),
                      ),
                      const Spacer(),
                      const Text(
                        'View and buy',
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
