import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/theme/constant.dart';
import 'package:shop/util/repository/repository.dart';
import 'package:shop/widgets/buildchip/build_chip.dart';

import '../../view/login/login_views.dart';

class HomeItems extends StatelessWidget {
  const HomeItems({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Consumer<Repository>(
      builder: (context, repository, child) {
        return Scaffold(
          appBar: AppBar(
            elevation: 0,
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 5),
                child: IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginViews()));
                    },
                    icon: const Icon(
                      Icons.person,
                      size: 35,
                      color: kblack,
                    )),
              )
            ],
            centerTitle: false,
            title: Padding(
              padding: const EdgeInsets.only(left: 6),
              child: Text(
                'Hi,please login !',
                style: textTheme.headline2,
              ),
            ),
          ),
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(top: 20, left: 20),
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
                  Row(
                    children: const [
                      BuildChip(text: "All", color: kred),
                      BuildChip(text: "Men", color: kred),
                      BuildChip(text: "Women", color: kred),
                      BuildChip(text: "Kids", color: kred)
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Expanded(
                      child: GridView.builder(
                          itemCount: repository.items.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2),
                          itemBuilder: (context, index) {
                            return Card();
                          }))
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
