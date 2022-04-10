// ignore_for_file: must_be_immutable
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shop/model/products_model/products_model.dart';
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
    final textTheme = Theme.of(context).textTheme;
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
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: kwhite,
                ),
                width: 120,
                height: 140,
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
              height: 15,
            ),
            Text(
              productsMode.title,
              style:
                  textTheme.labelLarge?.copyWith(fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
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
                  Text(
                    '€' + productsMode.price.toString(),
                    style: textTheme.labelLarge,
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.star_rate,
                        size: 18,
                        color: kyellow,
                      ),
                      Text(
                        productsMode.ratingModel.rate.toString(),
                        style: textTheme.labelLarge,
                      )
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
