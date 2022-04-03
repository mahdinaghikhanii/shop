// ignore_for_file: must_be_immutable
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shop/model/products_model.dart';
import 'package:shop/constant.dart';

class ShopList extends StatelessWidget {
  ShopList({
    Key? key,
    required this.productsMode,
    required this.ontap,
  }) : super(key: key);
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
                width: 110,
                height: 130,
                child: Hero(
                  tag: productsMode.id,
                  child: CachedNetworkImage(
                    imageUrl: productsMode.image,
                    fit: BoxFit.fill,
                  ),
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
            Padding(
              padding: const EdgeInsets.all(4),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text('€' + productsMode.price.toString()),
                  Row(
                    children: [
                      const Icon(
                        Icons.star_rate,
                        size: 18,
                        color: kyellow,
                      ),
                      Text(productsMode.ratingModel.rate.toString())
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
