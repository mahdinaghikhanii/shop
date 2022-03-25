// ignore_for_file: must_be_immutable
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shop/model/products_model.dart';
import 'package:shop/theme/constant.dart';

class ShopList extends StatelessWidget {
  ShopList({Key? key, required this.productsMode, required this.ontap})
      : super(key: key);
  ProductsModel productsMode;
  final Function()? ontap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: SizedBox(
        height: 300,
        width: 200,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Container(
                color: kwhite,
                width: 100,
                height: 100,
                child: CachedNetworkImage(
                  imageUrl: productsMode.imagee,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              productsMode.title,
              maxLines: 1,
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              children: [Text('€' + productsMode.price), Icon(Icons.start)],
            )
          ],
        ),
      ),
    );
  }
}
