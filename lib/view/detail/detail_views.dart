import 'package:cached_network_image/cached_network_image.dart';
import 'package:favorite_button/favorite_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/model/products_model.dart';
import 'package:shop/provider/detail_provider/detail_provider.dart';
import 'package:shop/provider/products_provider/products_provider.dart';
import 'package:shop/theme/constant.dart';
import 'package:shop/widgets/button_addcart/button_addcart.dart';
import 'package:shop/widgets/ratting_bar/ratting_bar.dart';
import '../../provider/app_provider/app_provider.dart';
import '../../widgets/add_remove_products_button/add_remove_products.dart';

// ignore: must_be_immutable
class DetailViews extends StatelessWidget {
  DetailViews({Key? key, required this.productsModel}) : super(key: key);
  ProductsModel productsModel;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final detailsProvider = Provider.of<DetailProvider>(context);
    final productsProvider = Provider.of<ProductsProvider>(context);
    return Scaffold(
      bottomNavigationBar: detailsProvider.currnetindexAddCart == 0
          ? ButtonAddcart(
              detailBTN: 'Buy Now',
              ontap: () {
                detailsProvider.addinAddCart();
              },
              price: productsModel.price.toString(),
            )
          : AddOrRemoveProducts(
              add: () {
                detailsProvider.addinAddCart();
              },
              price: productsModel.price.toString(),
              remove: () {
                detailsProvider.removeinAddcart();
              },
              quantity: detailsProvider.currnetindexAddCart.toString(),
            ),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: Padding(
            padding: const EdgeInsets.only(left: Constans.padding, top: 4),
            child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back_ios))),
        actions: [
          Padding(
              // ignore: unnecessary_const
              padding: const EdgeInsets.only(right: Constans.padding, top: 4),
              child: FavoriteButton(
                iconSize: 40,
                iconDisabledColor: grey,
                valueChanged: (_isFavorite) {
                  productsProvider.add(productsModel);
                },
              ))
        ],
        elevation: 0,
        foregroundColor:
            Provider.of<AppProvider>(context).brighness ? kwhite : kblack,
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(Constans.padding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                AspectRatio(
                  aspectRatio: 3 / 2,
                  child: Hero(
                      tag: productsModel.id,
                      child: CachedNetworkImage(imageUrl: productsModel.image)),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 30,
                  ),
                  child: Text(
                    productsModel.title,
                    style: textTheme.headline3,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'Product info',
                  style: textTheme.headline6,
                ),
                const SizedBox(
                  height: 5,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(productsModel.description,
                        maxLines: detailsProvider.getdescTextShowFlag ? 14 : 2,
                        textAlign: TextAlign.start,
                        style: textTheme.caption),
                    Row(
                      children: [
                        const Spacer(),
                        InkWell(
                          onTap: () {
                            detailsProvider.getdescTextShowFlag
                                ? detailsProvider.setdescTextShowFlag(false)
                                : detailsProvider.setdescTextShowFlag(true);
                          },
                          child: SizedBox(
                            width: 100,
                            height: 24,
                            child: detailsProvider.getdescTextShowFlag
                                ? const Text(
                                    "Show Less",
                                    style:
                                        TextStyle(color: kyellow, fontSize: 16),
                                    textAlign: TextAlign.end,
                                  )
                                : const Text(
                                    "Show More",
                                    style:
                                        TextStyle(color: kyellow, fontSize: 16),
                                    textAlign: TextAlign.end,
                                  ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Reviews(${productsModel.ratingModel.count.toString()})',
                      style: textTheme.headline6,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                productsModel.ratingModel.rate.toString(),
                                style: textTheme.headline5,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              const Text('/5',
                                  style: TextStyle(color: grey, fontSize: 16)),
                              const Spacer(),
                              RatingBars(productsModel: productsModel),
                            ],
                          ),
                          Text(
                            'Based on ${productsModel.ratingModel.count.toString()} Reviews',
                            style: const TextStyle(color: grey, fontSize: 11),
                          )
                        ]),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
