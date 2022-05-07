import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:shop/services/appwrite_auth.dart';
import 'package:shop/services/repository.dart';
import 'package:shop/services/send_email.dart';

import '../provider/app_provider/app_provider.dart';
import '../provider/bottomnavigationbar_provider/bottomnavigationbar_provider.dart';
import '../provider/cart_provider/cart_provider.dart';
import '../provider/detail_provider/detail_provider.dart';
import '../provider/favorite_provider/favorite_provider.dart';
import '../provider/onboard_provider/onboard_provider.dart';
import '../provider/widget_provider/widget_provider.dart';

List<SingleChildWidget> providers = [
  ChangeNotifierProvider(create: (context) => WidgetProvider()),
  ChangeNotifierProvider(create: (context) => AppwriteAuth()),
  ChangeNotifierProvider(create: (context) => CartProvider()),
  ChangeNotifierProvider(create: (context) => SendEmail()),
  ChangeNotifierProvider(create: (context) => FavoriteProvider()),
  ChangeNotifierProvider(create: (context) => DetailProvider()),
  ChangeNotifierProvider<OnBoardProvider>(
      create: (context) => OnBoardProvider()),
  ChangeNotifierProvider<AppProvider>(create: (context) => AppProvider()),
  ChangeNotifierProvider<Repository>(create: (context) => Repository()),
  ChangeNotifierProvider<BottomNavigationBarProvider>(
      create: (context) => BottomNavigationBarProvider()),
];
