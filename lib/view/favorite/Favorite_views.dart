// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/constant.dart';
import 'package:shop/generated/l10n.dart';
import 'package:shop/widgets/favorite_items/favorite_items.dart';

import '../../provider/favorite_provider/favorite_provider.dart';
import '../../widgets/nothing_is_here/nothing_is_here.dart';

class FavoriteViews extends StatelessWidget {
  const FavoriteViews({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var multilanguage = S.of(context);
    context.watch<FavoriteProvider>().countFavorite();
    final favoriteProvider = Provider.of<FavoriteProvider>(context);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        centerTitle: false,
        titleSpacing: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios,
              color: Theme.of(context).bottomAppBarColor),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Padding(
          padding: const EdgeInsets.only(
            left: Constans.padding,
          ),
          child: Text(
            multilanguage.appbar_favorite,
            style: Theme.of(context).textTheme.subtitle1,
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: favoriteProvider.lenghFavorite == 0
            ? MainAxisAlignment.center
            : MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          favoriteProvider.lenghFavorite == 0
              ? NothingIsHere(text: multilanguage.favorite_text_nowhavecart)
              : const FavoriteItems(),
        ],
      ),
    );
  }
}
