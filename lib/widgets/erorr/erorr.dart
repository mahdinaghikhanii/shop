import 'package:flutter/material.dart';

class Erorr extends StatelessWidget {
  const Erorr({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset('assets/img/erorr.png'),
        const Text('Sory !\nWe have Problems Here!'),
        Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
        )
      ],
    );
  }
}
