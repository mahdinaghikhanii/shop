import 'package:flutter/material.dart';
import 'package:shop/theme/constant.dart';
import 'package:shop/view/home/home_views.dart';

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
            style: Theme.of(context).textTheme.headline2,
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 30,
          ),
          InkWell(
            onTap: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => const HomeViews()));
            },
            child: Container(
              width: 180,
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: kyellow,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Try Again',
                      style: Theme.of(context).textTheme.subtitle2,
                    ),
                  ),
                  const SizedBox(
                    width: 0,
                  ),
                  const Icon(
                    Icons.refresh,
                    color: kwhite,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
