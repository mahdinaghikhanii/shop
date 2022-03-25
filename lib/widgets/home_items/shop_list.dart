// ignore_for_file: must_be_immutable
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shop/model/products_model.dart';

class ShopList extends StatelessWidget {
  ShopList({Key? key, required this.productsMode, required this.ontap})
      : super(key: key);
  ProductsModel productsMode;
  final Function()? ontap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 150,
            height: 130,
            child: CachedNetworkImage(
              imageUrl: productsMode.imagee,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            productsMode.title,
            maxLines: 2,
          )
        ],
      ),
    );
  }
}
