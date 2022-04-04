import 'package:flutter/material.dart';

import '../../constant.dart';

class DivderDefualt extends StatelessWidget {
  const DivderDefualt({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Divider(
      indent: Constans.padding,
      endIndent: Constans.padding,
      color: grey,
    );
  }
}
