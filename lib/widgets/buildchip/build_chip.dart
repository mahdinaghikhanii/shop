import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/constant.dart';
import 'package:shop/generated/l10n.dart';
import 'package:shop/main.dart';
import 'package:shop/view/home/home_views.dart';

import '../../repository/repository.dart';

class BuildChip extends StatelessWidget {
  const BuildChip({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var multilanguage = S.of(context);
    final choiceProvider = Provider.of<Repository>(context, listen: true);
    List _choice = [
      multilanguage.home_buildchip_text_All,
      multilanguage.home_buildchip_text_men,
      multilanguage.home_buildchip_text_woman,
      multilanguage.home_buildchip_text_jewelry
    ];
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: _choice.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            padding: const EdgeInsets.only(right: 5, left: 5),
            child: ChoiceChip(
              backgroundColor: kwhite,
              label: Text(
                _choice[index],
                style: TextStyle(
                    fontFamily: appProvider.language == const Locale('en')
                        ? faPrimaryFontFamily
                        : "",
                    color: choiceProvider.currentIndexBuildChip == index
                        ? kwhite
                        : kblackappbar),
              ),
              selectedColor: kyellow,
              selected: choiceProvider.currentIndexBuildChip == index,
              onSelected: (value) {
                choiceProvider.setcurrentIndexBuildChip(index, value);

                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => const HomeViews()));
              },
            ),
          );
        },
      ),
    );
  }
}
