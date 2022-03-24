// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shop/theme/constant.dart';
import 'package:shop/view/home/home_views.dart';

class GetStartViews extends StatelessWidget {
  const GetStartViews({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 0,
            ),
            Text(
              'Welcome\nNew collection\nSpring 2022 ! ',
              style: textTheme.headline5,
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              children: [
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(25),
                    onTap: () async {
                      SharedPreferences sharedPreferences =
                          await SharedPreferences.getInstance();
                      sharedPreferences.setInt('getStart-KEY', 0);
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const HomeViews()));
                    },
                    child: Container(
                        height: 80,
                        width: 80,
                        decoration: const BoxDecoration(
                            color: Colors.black, shape: BoxShape.circle),
                        child: const Icon(
                          Icons.keyboard_arrow_right,
                          color: kwhite,
                          size: 30,
                        )),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 65,
            ),
            Center(
                child: SizedBox(
                    width: 300, child: Image.asset('assets/img/cloth.png')))
          ],
        ),
      )),
    );
  }
}
