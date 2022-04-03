import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/constant.dart';

import 'package:shop/view/detail/detail_views.dart';
import 'package:shop/widgets/buildchip/build_chip.dart';
import 'package:shop/widgets/erorr/erorr.dart';
import 'package:shop/widgets/home_items/shop_list.dart';

import '../../provider/app_provider/app_provider.dart';
import '../../provider/repository/repository.dart';
import '../../view/login/login_views.dart';

class HomeItems extends StatelessWidget {
  const HomeItems({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Repository>(context, listen: false);
    product.featchData();

    final textTheme = Theme.of(context).textTheme;
    final appProvider = Provider.of<AppProvider>(context, listen: true);

    return FutureBuilder(
        future: Provider.of<Repository>(context, listen: false).featchData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.connectionState == ConnectionState.none) {
            return const Erorr();
          } else {
            return Scaffold(
              appBar: AppBar(
                centerTitle: false,
                titleSpacing: 0,
                title: Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Text(
                    'Hi,pleaselogin!',
                    style: textTheme.headline2,
                  ),
                ),
                leadingWidth: 1000,
                automaticallyImplyLeading: false,
                elevation: 0,
                actions: [
                  Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: IconButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const LoginViews()));
                        },
                        icon: Icon(
                          Icons.person,
                          size: 35,
                          color: appProvider.brighness ? kwhite : kblackappbar,
                        )),
                  )
                ],
              ),
              body: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
                  child: Column(
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
                      const SizedBox(
                        height: 20,
                      ),
                      Expanded(
                          child: GridView.builder(
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
                              }))
                    ],
                  ),
                ),
              ),
            );
          }
        });
  }
}
