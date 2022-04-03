import 'package:flutter/material.dart';
import 'package:shop/widgets/small_button/small_button.dart';

class AddRemoveProductsBtnCart extends StatelessWidget {
  const AddRemoveProductsBtnCart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 4),
      child: Row(
        children: [
          SmallButton(
            iconData: Icons.remove,
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
