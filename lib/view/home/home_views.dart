import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:provider/provider.dart';
import 'package:shop/theme/constant.dart';
import 'package:shop/util/bottomnavigationbar_provider/bottomnavigationbar_provider.dart';
import 'package:shop/util/repository/repository.dart';
import 'package:shop/view/login/login_views.dart';
import 'package:shop/view/setting/setting_views.dart';
import 'package:shop/widgets/home_items/home_items.dart';

class HomeViews extends StatelessWidget {
  const HomeViews({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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

    // ignore: unused_local_variable
    final productProvider = Provider.of<Repository>(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 5),
            child: IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginViews()));
                },
                icon: const Icon(
                  Icons.person,
                  size: 30,
                  color: kblack,
                )),
          )
        ],
        centerTitle: false,
        title: Padding(
          padding: const EdgeInsets.only(left: 6),
          child: Text(
            'Hi,please login !',
            style: textTheme.headline2,
          ),
        ),
      ),
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
            color: kblack, // unselected icon color
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
                text: 'Profile',
              ),
            ],
            onTabChange: (index) {
              bottomNavigationBar.setcurrentIndex(index);
            },
          )),
    );
  }
}
