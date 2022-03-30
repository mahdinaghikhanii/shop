import 'package:flutter/material.dart';
import 'package:shop/theme/constant.dart';

class Erorr extends StatelessWidget {
  const Erorr({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(Constans.padding),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset('assets/gif/erorr.gif'),
          Text(
            'Sory !\nWe have Problems Here!',
            style: Theme.of(context).textTheme.subtitle1,
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 30,
          ),
          Container(
            width: 200,
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: kyellow,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text('Try Again'),
                SizedBox(
                  width: 8,
                ),
                Icon(Icons.refresh)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
