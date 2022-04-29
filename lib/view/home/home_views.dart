import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:provider/provider.dart';
import 'package:shop/generated/l10n.dart';
import 'package:shop/provider/bottomnavigationbar_provider/bottomnavigationbar_provider.dart';
import 'package:shop/provider/cart_provider/cart_provider.dart';
import 'package:shop/constant.dart';
import 'package:shop/view/cart/cart_views.dart';
import 'package:shop/view/setting/setting_views.dart';
import 'package:shop/widgets/home_items/home_items.dart';
import '../../provider/app_provider/app_provider.dart';

class HomeViews extends StatelessWidget {
  const HomeViews({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var multilanguage = S.of(context);

    final appProvider = Provider.of<AppProvider>(context);

    final bottomNavigationBar =
        Provider.of<BottomNavigationBarProvider>(context);
    final cartProvider = Provider.of<CartProvider>(context);
    // ignore: constant_identifier_names
    const List Screans = [
      HomeItems(),
      // SearchViews(),
      CartViews(),
      SettingViews(),
    ];

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
            tabs: [
              GButton(
                textStyle:
                    Theme.of(context).textTheme.button?.copyWith(color: kwhite),
                icon: Icons.home,
                text: multilanguage.naemBtnNavigationInHomeViews_Home,
              ),
              GButton(
                icon: Icons.badge_outlined,
                text: cartProvider.countAddCart == 0
                    ? multilanguage.naemBtnNavigationInHomeViews_Cart
                    : multilanguage.naemBtnNavigationInHomeViews_Cart +
                        cartProvider.countAddCart.toString(),
                textStyle:
                    Theme.of(context).textTheme.button?.copyWith(color: kwhite),
              ),
              GButton(
                icon: Icons.settings,
                text: multilanguage
                    .naemBtnNavigationInHomeViews_Setting_andAppbarSetting,
                textStyle:
                    Theme.of(context).textTheme.button?.copyWith(color: kwhite),
              ),
            ],
            onTabChange: (index) {
              bottomNavigationBar.setcurrentIndex(index);
            },
          )),
    );
  }
}
