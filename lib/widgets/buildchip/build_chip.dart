import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/util/repository/repository.dart';

class BuildChip extends StatelessWidget {
  const BuildChip({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final choiceProvider = Provider.of<Repository>(context);
    List _choice = ["All", "Men", "Women", "Kids"];
    return Padding(
      padding: const EdgeInsets.only(right: 10, top: 20),
      child: ListView.builder(
        itemCount: _choice.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            padding: const EdgeInsets.only(right: 10),
            child: ChoiceChip(
              label: Text(_choice[index]),
              selected: choiceProvider.currentIndexBuildChip == index,
              onSelected: (value) {
                choiceProvider.setcurrentIndexBuildChip(index);
              },
            ),
          );
        },
      ),
    );
  }
}
