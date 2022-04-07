import 'package:flutter/material.dart';
import 'package:shop/view/cart/cart_views.dart';
import 'package:shop/view/favorite/Favorite_views.dart';
import 'package:shop/view/help/help_views.dart';
import 'package:shop/view/home/home_views.dart';
import 'package:shop/view/login/login_views.dart';
import 'package:shop/view/onboard/onboard_views.dart';
import 'package:shop/view/search/search_views.dart';
import 'package:shop/view/setting/setting_views.dart';
import 'package:shop/view/signup/signup_views.dart';
import 'package:shop/widgets/erorr/erorr.dart';
import '../view/help/contact_us/contact_us.dart';

class RouteManager {
  static const String cartViews = '/cartViews';
  static const String detailViews = '/detailViews';
  static const String favoriteViews = '/favoriteViews';
  static const String helpViews = '/helpViews';
  static const String homeViews = '/homeViews';
  static const String loginViews = '/loginViews';
  static const String onBoardViews = '/onBoardViews';
  static const String searchViews = '/searchViews';
  static const String settingViews = '/settingViews';
  static const String signUp = '/signup';
  static const String contactUs = '/contactUs';
  static const String appInfo = '/appInfo';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case cartViews:
        return MaterialPageRoute(builder: ((context) => const CartViews()));
      case favoriteViews:
        return MaterialPageRoute(builder: (context) => const FavoriteViews());
      case helpViews:
        return MaterialPageRoute(builder: (context) => const HelpViews());
      case homeViews:
        return MaterialPageRoute(builder: (context) => const HomeViews());
      case loginViews:
        return MaterialPageRoute(builder: (context) => const LoginViews());
      case onBoardViews:
        return MaterialPageRoute(builder: (context) => const OnBoardViews());
      case searchViews:
        return MaterialPageRoute(builder: (context) => const SearchViews());
      case settingViews:
        return MaterialPageRoute(builder: (context) => const SettingViews());
      case signUp:
        return MaterialPageRoute(builder: (context) => const SignUpViews());
      case contactUs:
        return MaterialPageRoute(builder: (context) => const ContactUs());
      case appInfo:
        return MaterialPageRoute(builder: (context) => const ContactUs());
    }
    return _errorRoute();
  }
}

Route<dynamic> _errorRoute() {
  return MaterialPageRoute(builder: (_) {
    return const Erorr();
  });
}
