import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/model/products_model.dart';
import 'package:shop/theme/constant.dart';

import '../../provider/app_provider/app_provider.dart';
import '../../provider/detail_provider/detail_provider.dart';

// ignore: must_be_immutable
class DetailViews extends StatelessWidget {
  DetailViews({Key? key, required this.productsModel}) : super(key: key);
  ProductsModel productsModel;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final detailsProvider = Provider.of<DetailProvider>(context);

    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(
            right: Constans.padding, left: Constans.padding, bottom: 10),
        child: SafeArea(
          child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: kyellow,
              ),
              width: double.infinity,
              height: 60,
              child: Center(
                  child: Text(
                'Add Cart',
                style: textTheme.subtitle2,
              ))),
        ),
      ),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: Padding(
            padding: const EdgeInsets.only(left: Constans.padding, top: 4),
            child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back_ios))),
        actions: const [
          Padding(
            // ignore: unnecessary_const
            padding: const EdgeInsets.only(right: Constans.padding, top: 4),
            child: Icon(
              Icons.favorite_border_sharp,
              color: kred,
              size: Constans.defualtIconSize,
            ),
          )
        ],
        elevation: 0,
        foregroundColor:
            Provider.of<AppProvider>(context).brighness ? kwhite : kblack,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(Constans.padding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              AspectRatio(
                aspectRatio: 3 / 2,
                child: Hero(
                    tag: productsModel.id,
                    child: CachedNetworkImage(imageUrl: productsModel.image)),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 30,
                ),
                child: Text(
                  productsModel.title,
                  style: textTheme.headline3,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(productsModel.description,
                      maxLines: detailsProvider.getdescTextShowFlag ? 14 : 2,
                      textAlign: TextAlign.start,
                      style: textTheme.caption),
                  InkWell(
                    onTap: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        detailsProvider.getdescTextShowFlag
                            ? const Text(
                                "Show Less",
                                style: TextStyle(color: kyellow, fontSize: 16),
                              )
                            : const Text("Show More",
                                style: TextStyle(color: kyellow, fontSize: 16))
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
