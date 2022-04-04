// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/constant.dart';
import 'package:shop/provider/favorite_provider/favorite_provider.dart';
import 'package:shop/widgets/favorite_items/favorite_items.dart';
import 'package:shop/widgets/nothing_is_here/nothing_is_here.dart';

class FavoriteViews extends StatelessWidget {
  const FavoriteViews({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final favoriteProvider = Provider.of<FavoriteProvider>(context);
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
      body: Column(
        mainAxisAlignment: favoriteProvider.countFavorite == 0
            ? MainAxisAlignment.center
            : MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          favoriteProvider.countFavorite == 0
              ? const NothingIsHere(text: "You have no\nFavorite :(")
              : const FavoriteItems(),
        ],
      ),
    );
  }
}
