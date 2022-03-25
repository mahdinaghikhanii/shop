import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/model/products_model.dart';
import 'package:shop/theme/constant.dart';
import 'package:shop/util/app_provider/app_provider.dart';

// ignore: must_be_immutable
class DetailViews extends StatelessWidget {
  DetailViews({Key? key, required this.productsModel}) : super(key: key);
  ProductsModel productsModel;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(
            right: Constans.padding, left: Constans.padding),
        child: SafeArea(
          child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: kyellow,
              ),
              width: double.infinity,
              height: 70,
              child: Center(
                  child: Text(
                'Add Cart',
                style: textTheme.subtitle2,
              ))),
        ),
      ),
      appBar: AppBar(
        actions: const [
          Padding(
            // ignore: unnecessary_const
            padding: const EdgeInsets.only(right: Constans.padding),
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
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(Constans.padding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              AspectRatio(
                aspectRatio: 1,
                child: Hero(
                    tag: productsModel.id,
                    child: CachedNetworkImage(imageUrl: productsModel.imagee)),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Text(
                  productsModel.title,
                  style: textTheme.headline3,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
