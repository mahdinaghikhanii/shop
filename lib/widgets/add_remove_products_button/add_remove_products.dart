import 'package:flutter/material.dart';
import 'package:shop/theme/constant.dart';

class AddOrRemoveProducts extends StatelessWidget {
  const AddOrRemoveProducts(
      {Key? key,
      required this.price,
      required this.add,
      required this.quantity,
      required this.remove})
      : super(key: key);
  final String price;
  final Function() add;
  final Function() remove;
  final String quantity;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.only(
          right: Constans.padding, left: Constans.padding, bottom: 10),
      child: SafeArea(
        child: Row(
          children: [
            Text(
              "€ " + price + "\nUnit price",
              style: textTheme.headline6,
            ),
            const Spacer(),
            InkWell(
              borderRadius: BorderRadius.circular(Constans.kborderRadios),
              onTap: add,
              child: Container(
                width: 70,
                height: 40,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Constans.kborderRadios),
                    color: kyellow),
                child: const Icon(Icons.remove, color: kwhite),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  right: Constans.padding, left: Constans.padding),
              child: Text(quantity),
            ),
            InkWell(
              borderRadius: BorderRadius.circular(Constans.kborderRadios),
              onTap: add,
              child: Container(
                width: 70,
                height: 40,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Constans.kborderRadios),
                    color: kyellow),
                child: const Icon(Icons.add, color: kwhite),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
