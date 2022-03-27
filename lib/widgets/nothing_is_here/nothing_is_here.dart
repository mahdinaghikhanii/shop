import 'package:flutter/material.dart';

class NothingIsHere extends StatelessWidget {
  const NothingIsHere({Key? key, required this.text}) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Image.asset(
            'assets/img/box.png',
            width: 200,
          ),
          const SizedBox(
            height: 30,
          ),
          Text(
            text,
            style: Theme.of(context).textTheme.subtitle1,
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
