import 'package:flutter/material.dart';
import 'package:shop/theme/constant.dart';
import 'package:shop/widgets/buildchip/build_chip.dart';

class HomeItems extends StatelessWidget {
  const HomeItems({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Padding(
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
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: const [
                BuildChip(text: "All", color: kred),
                BuildChip(text: "Men", color: kred),
                BuildChip(text: "Women", color: kred),
                BuildChip(text: "Kids", color: kred)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
