import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/constant.dart';
import 'package:shop/generated/l10n.dart';
import 'package:shop/widgets/buildchip/build_chip.dart';
import 'package:shop/widgets/erorr/erorr.dart';
import 'package:shop/widgets/home_items/shop_list.dart';
import 'package:shop/widgets/loading/loading.dart';
import '../../services/repository.dart';
import '../../view/detail/detail_views.dart';

class HomeItems extends StatelessWidget {
  const HomeItems({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var multilanguage = S.of(context);
    final product = Provider.of<Repository>(context, listen: false);
    product.featchData();
    final textTheme = Theme.of(context).textTheme;

    return FutureBuilder(
        future: Provider.of<Repository>(context, listen: false).featchData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(Constans.padding),
                child: GridView.builder(
                    addAutomaticKeepAlives: true,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 8,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 20,
                            childAspectRatio: 0.80,
                            mainAxisSpacing: 20),
                    itemBuilder: (context, index) {
                      return const Loading();
                    }),
              ),
            );
            // ignore: unnecessary_null_comparison
          } else if (product.getStatusCode == 8) {
            return const Erorr();
          } else if (snapshot.hasError) {
            return const Erorr();
          } else {
            return Scaffold(
              extendBodyBehindAppBar: true,
              body: Scrollbar(
                child: SafeArea(
                    child: LayoutBuilder(builder: ((context, constraints) {
                  return CustomScrollView(
                    slivers: [
                      SliverAppBar(
                        automaticallyImplyLeading: false,
                        elevation: 0,
                        expandedHeight: 160,
                        centerTitle: false,
                        toolbarHeight: 160,
                        pinned: false,
                        floating: true,
                        flexibleSpace: const FlexibleSpaceBar(
                            titlePadding: EdgeInsets.only(top: 20)),
                        title: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(right: 10, left: 10),
                              child: Text(
                                multilanguage
                                    .home_buoldchip_text_Themostpopular,
                                style: textTheme.subtitle1,
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(right: 10, left: 10),
                              child: Text(
                                multilanguage.home_buildchip_text_clothestoday,
                                style:
                                    textTheme.headline1?.copyWith(fontSize: 18),
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(right: 5, left: 5),
                              child: SizedBox(
                                  height: 70,
                                  width: double.infinity,
                                  child: BuildChip()),
                            ),
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
                                                builder: (context) =>
                                                    DetailViews(
                                                      productsModel:
                                                          product.items[index],
                                                    )));
                                      },
                                    );
                                  }),
                            ),
                          ]),
                        ),
                      )
                    ],
                  );
                }))),
              ),
            );
          }
        });
  }
}
