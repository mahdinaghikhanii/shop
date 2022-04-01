// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'package:shop/model/products_model.dart';
import 'package:shop/theme/constant.dart';

class RatingBars extends StatelessWidget {
  RatingBars({Key? key, required this.productsModel}) : super(key: key);
  ProductsModel productsModel;

  @override
  Widget build(BuildContext context) {
    return RatingBar.builder(
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
      onRatingUpdate: (Null) {},
    );
  }
}
