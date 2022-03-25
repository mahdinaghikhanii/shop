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
    return Scaffold(
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
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              AspectRatio(
                aspectRatio: 1,
                child: Hero(
                    tag: productsModel.id,
                    child: CachedNetworkImage(imageUrl: productsModel.imagee)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
