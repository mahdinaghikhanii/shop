// ignore_for_file: unused_local_variable
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shop/model/onoard_model.dart';
import 'package:shop/constant.dart';
import 'package:shop/view/home/home_views.dart';

import '../../provider/onboard_provider/onboard_provider.dart';

class OnBoardViews extends StatefulWidget {
  const OnBoardViews({Key? key}) : super(key: key);

  @override
  State<OnBoardViews> createState() => _OnBoardViewsState();
}

class _OnBoardViewsState extends State<OnBoardViews> {
  late PageController _pageController;
  List<OnboardModel> screans = <OnboardModel>[
    OnboardModel(
      title: 'Welcome\nNew collection\nSpring 2022 ! ',
      img: 'assets/img/cloth1.png',
    ),
    OnboardModel(
      title: 'Weve got over\n1000 styles at\n50% off or higher ',
      img: 'assets/img/cloth2.png',
    ),
    OnboardModel(
      title: 'See All\nand choice !',
      img: 'assets/img/cloth3.png',
    )
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
  }

  _storeOnboardInfo() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setInt('getStart-KEY', 0);
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    final onboardProvider = Provider.of<OnBoardProvider>(context);

    return Scaffold(
        body: PageView.builder(
            itemCount: screans.length,
            controller: _pageController,
            physics: const NeverScrollableScrollPhysics(),
            onPageChanged: (int index) async {
              onboardProvider.setCurentIndexGetStart(index);
            },
            itemBuilder: (context, index) {
              return FadeInRight(
                child: Column(
                  children: [
                    SafeArea(
                        child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 0,
                          ),
                          Text(
                            screans[index].title,
                            style: textTheme.headline5,
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                height: 10.0,
                                child: ListView.builder(
                                  itemCount: screans.length,
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) {
                                    return Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Container(
                                            margin: const EdgeInsets.symmetric(
                                                horizontal: 3.0),
                                            width: onboardProvider
                                                        .getCurentIndexOnBoard ==
                                                    index
                                                ? 30
                                                : 8,
                                            height: 8,
                                            decoration: BoxDecoration(
                                              color: onboardProvider
                                                          .getCurentIndexOnBoard ==
                                                      index
                                                  ? kblackappbar
                                                  : grey,
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                            ),
                                          ),
                                        ]);
                                  },
                                ),
                              ),
                              const Spacer(),
                              Padding(
                                padding: const EdgeInsets.only(right: 15),
                                child: InkWell(
                                  borderRadius: BorderRadius.circular(25),
                                  onTap: () async {
                                    if (index == screans.length - 1) {
                                      await _storeOnboardInfo();
                                      Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const HomeViews()));
                                    }
                                    _pageController.nextPage(
                                        duration:
                                            const Duration(microseconds: 400),
                                        curve: Curves.bounceIn);
                                  },
                                  child: Container(
                                      height: 80,
                                      width: 80,
                                      decoration: const BoxDecoration(
                                          color: Colors.black,
                                          shape: BoxShape.circle),
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
                            height: 50,
                          ),
                          Center(
                              child: SizedBox(
                                  width:
                                      onboardProvider.getCurentIndexOnBoard != 2
                                          ? 300
                                          : 250,
                                  child: Image.asset(screans[index].img)))
                        ],
                      ),
                    )),
                  ],
                ),
              );
            }));
  }
}
