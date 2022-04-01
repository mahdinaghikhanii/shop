import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/main.dart';
import 'package:shop/theme/constant.dart';
import 'package:shop/view/home/home_views.dart';
import '../../provider/repository/repository.dart';

class BuildChip extends StatelessWidget {
  const BuildChip({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final choiceProvider = Provider.of<Repository>(context, listen: true);
    List _choice = ["All", "Men", "Women", "jewelery"];
    return Padding(
      padding: const EdgeInsets.only(right: 10, top: 20),
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: _choice.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            padding: const EdgeInsets.only(right: 10),
            child: ChoiceChip(
              backgroundColor: kwhite,
              label: Text(
                _choice[index],
                style: TextStyle(
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
