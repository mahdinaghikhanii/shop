import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';
import 'package:shop/model/products_model.dart';
import 'package:shop/provider/detail_provider/detail_provider.dart';
import 'package:shop/theme/constant.dart';

import '../../provider/app_provider/app_provider.dart';

// ignore: must_be_immutable
class DetailViews extends StatelessWidget {
  DetailViews({Key? key, required this.productsModel}) : super(key: key);
  ProductsModel productsModel;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final detailsProvider = Provider.of<DetailProvider>(context);

    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(
            right: Constans.padding, left: Constans.padding, bottom: 10),
        child: SafeArea(
          child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: kyellow,
              ),
              width: double.infinity,
              height: 60,
              child: Center(
                  child: Text(
                'Add Cart',
                style: textTheme.subtitle2,
              ))),
        ),
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
        actions: const [
          Padding(
            // ignore: unnecessary_const
            padding: const EdgeInsets.only(right: Constans.padding, top: 4),
            child: Icon(
              Icons.favorite_border_sharp,
              color: kred,
              size: Constans.defualtIconSize,
            ),
          )
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
                Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: Text(productsModel.ratingModel.rate.toString()),
                ),
                const SizedBox(
                  height: 10,
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
                      height: 10,
                    ),
                    RatingBar.builder(
                      initialRating: productsModel.ratingModel.rate,
                      minRating: 1,
                      direction: Axis.horizontal,
                      allowHalfRating: false,
                      itemCount: 5,
                      itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                      itemBuilder: (context, _) => const Icon(
                        Icons.star,
                        color: kyellow,
                      ),
                      onRatingUpdate: (double value) {},
                    ),
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
