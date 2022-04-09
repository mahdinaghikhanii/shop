// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/constant.dart';
import 'package:shop/provider/favorite_provider/favorite_provider.dart';
import 'package:shop/widgets/favorite_items/favorite_items.dart';

class FavoriteViews extends StatelessWidget {
  const FavoriteViews({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //  final favoriteProvider = Provider.of<FavoriteProvider>(context);

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
            'My Favorite',
            style: Theme.of(context).textTheme.subtitle1,
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment:

            //    ? MainAxisAlignment.center
            MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          //  context.watch<FavoriteProvider>().seeLengthFavorite() == 0
          //    ? const NothingIsHere(text: "You have no\nFavorite :(")
          FavoriteItems(),
        ],
      ),
    );
  }
}
