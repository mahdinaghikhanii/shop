import 'package:flutter/material.dart';

import '../skelton/skelton.dart';

class Loading extends StatelessWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Skelton(
          height: 140,
          width: 120,
        ),
        const SizedBox(
          height: 10,
        ),
        const Skelton(height: 20, width: 160),
        const SizedBox(
          height: 10,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Skelton(height: 20, width: 60),
            SizedBox(
              width: 20,
            ),
            Skelton(height: 20, width: 60),
          ],
        )
      ],
    );
  }
}
