// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:provider/provider.dart';
import 'package:shop/theme/constant.dart';
import 'package:shop/util/app_provider/app_provider.dart';
import 'package:shop/util/bottomnavigationbar_provider/bottomnavigationbar_provider.dart';
import 'package:shop/util/repository/repository.dart';
import 'package:shop/view/setting/setting_views.dart';
import 'package:shop/widgets/home_items/home_items.dart';

class HomeViews extends StatelessWidget {
  const HomeViews({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appProvider = Provider.of<AppProvider>(context);
    final textTheme = Theme.of(context).textTheme;
    final bottomNavigationBar =
        Provider.of<BottomNavigationBarProvider>(context);
    // ignore: non_constant_identifier_names
    List Screans = [
      const HomeItems(),
      const HomeItems(),
      const HomeItems(),
      const SettingViews(),
    ];

    final productProvider = Provider.of<Repository>(context);
    return Scaffold(
      body: Screans[bottomNavigationBar.currentIndex],
      bottomNavigationBar: SafeArea(
          minimum: const EdgeInsets.all(20),
          child: GNav(
            rippleColor:
                Colors.yellowAccent, // tab button ripple color when pressed
            hoverColor: Colors.white, // tab button hover color
            haptic: true, // haptic feedback
            tabBorderRadius: 15,
            // tab button border
            tabBorder: Border.all(
                color: Theme.of(context).scaffoldBackgroundColor,
                width: 0), // tab button border
            tabShadow: [
              BoxShadow(color: Theme.of(context).scaffoldBackgroundColor)
            ], // tab button shadow
            curve: Curves.easeOutExpo, // tab animation curves
            duration:
                const Duration(milliseconds: 800), // tab animation duration
            gap: 10, // the tab button gap between icon and text
            color: appProvider.brighness
                ? kwhite
                : kblack, // unselected icon color
            activeColor: Colors.white, // selected icon and text color
            iconSize: 24, // tab button icon sizem
            selectedIndex: bottomNavigationBar.currentIndex,

            tabBackgroundColor: const Color(0xFFFEAC5D)
                .withOpacity(1), // selected tab background color
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            tabs: const [
              GButton(
                icon: Icons.home,
                text: 'Home',
              ),
              GButton(
                icon: Icons.search,
                text: 'Search',
              ),
              GButton(
                icon: Icons.badge_outlined,
                text: 'Cart',
              ),
              GButton(
                icon: Icons.settings,
                text: 'Setting',
              ),
            ],
            onTabChange: (index) {
              bottomNavigationBar.setcurrentIndex(index);
            },
          )),
    );
  }
}
