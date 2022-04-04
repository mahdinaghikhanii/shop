// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:shop/constant.dart';
import 'package:shop/widgets/favorite_items/favorite_items.dart';

class FavoriteViews extends StatelessWidget {
  const FavoriteViews({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        centerTitle: false,
        titleSpacing: 0,
        title: Padding(
          padding: const EdgeInsets.only(
              left: Constans.padding, top: Constans.padding),
          child: Text(
            'My Favorite',
            style: Theme.of(context).textTheme.subtitle1,
          ),
        ),
      ),
      body: SafeArea(
        child: FavoriteItems(),
      ),
    );
  }
}
