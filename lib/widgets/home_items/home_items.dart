import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/constant.dart';
import 'package:shop/widgets/buildchip/build_chip.dart';
import 'package:shop/widgets/erorr/erorr.dart';
import 'package:shop/widgets/home_items/shop_list.dart';

import '../../repository/repository.dart';
import '../../view/detail/detail_views.dart';

class HomeItems extends StatelessWidget {
  const HomeItems({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Repository>(context, listen: false);
    product.featchData();
    final textTheme = Theme.of(context).textTheme;

    return FutureBuilder(
        future: Provider.of<Repository>(context, listen: false).featchData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
            // ignore: unnecessary_null_comparison
          } else if (product.featchData() == null) {
            return const Erorr();
          } else {
            return Scaffold(
              extendBodyBehindAppBar: true,
              body: SafeArea(
                  child: LayoutBuilder(builder: ((context, constraints) {
                return CustomScrollView(
                  slivers: [
                    SliverAppBar(
                      elevation: 0,
                      expandedHeight: 160,
                      centerTitle: false,
                      toolbarHeight: 160,
                      pinned: false,
                      floating: true,
                      flexibleSpace: const FlexibleSpaceBar(
                          titlePadding:
                              EdgeInsets.only(top: 20, left: 20, right: 20)),
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'The most popular',
                            style: textTheme.subtitle1,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            'clothes today',
                            style: textTheme.headline1,
                          ),
                          const SizedBox(
                              height: 70,
                              width: double.infinity,
                              child: BuildChip()),
                        ],
                      ),
                    ),
                    SliverPadding(
                      padding: const EdgeInsets.all(Constans.padding),
                      sliver: SliverList(
                          delegate: SliverChildListDelegate([
                        ConstrainedBox(
                          constraints: const BoxConstraints.tightFor(
                              width: double.infinity),
                          child: GridView.builder(
                              addAutomaticKeepAlives: true,
                              shrinkWrap: true,
                              physics: const ScrollPhysics(),
                              itemCount: product.items.length,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      crossAxisSpacing: 20,
                                      childAspectRatio: 0.80,
                                      mainAxisSpacing: 20),
                              itemBuilder: (context, index) {
                                return ShopList(
                                  productsMode: product.items[index],
                                  ontap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => DetailViews(
                                                  productsModel:
                                                      product.items[index],
                                                )));
                                  },
                                );
                              }),
                        )
                      ])),
                    )
                  ],
                );
              }))),
            );
          }
        });
  }
}
