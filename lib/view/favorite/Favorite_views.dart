import 'package:flutter/material.dart';
import 'package:shop/theme/constant.dart';
import 'package:shop/widgets/nothing_is_here/nothing_is_here.dart';

class FavoriteViews extends StatelessWidget {
  const FavoriteViews({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        leadingWidth: 120,
        leading: Padding(
          padding: const EdgeInsets.only(left: Constans.padding),
          child: Text(
            'Favorite',
            style: Theme.of(context).textTheme.subtitle1,
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(Constans.padding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 30,
              ),
              NothingIsHere(
                text: "You have no\nCart :(",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
