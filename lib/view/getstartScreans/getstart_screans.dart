// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:shop/theme/constant.dart';
import 'package:shop/view/homescreans/home_screans.dart';

class GetStartScreans extends StatelessWidget {
  const GetStartScreans({Key? key}) : super(key: key);

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
              'New collection\nSpring 2022',
              style: textTheme.headline5,
            ),
            const SizedBox(
              height: 40,
            ),
            Row(
              children: [
                const Text(''),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: InkWell(
                    onTap: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const HomeScreans()));
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
