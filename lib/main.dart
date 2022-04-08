import 'dart:io';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';
// ignore: library_prefixes
import 'package:path_provider/path_provider.dart' as pathProvider;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shop/provider/bottomnavigationbar_provider/bottomnavigationbar_provider.dart';
import 'package:shop/provider/detail_provider/detail_provider.dart';
import 'package:shop/provider/favorite_provider/favorite_provider.dart';
import 'package:shop/provider/onboard_provider/onboard_provider.dart';
import 'package:shop/provider/products_provider/products_provider.dart';
import 'package:shop/repository/repository.dart';
import 'package:shop/repository/send_email.dart';
import 'package:shop/routes/routes.dart';
import 'package:shop/theme/configtheme.dart';
import 'package:shop/view/home/home_views.dart';
import 'package:shop/view/onboard/onboard_views.dart';
import 'provider/app_provider/app_provider.dart';

int? isviewWedWidgetGetStartScreans;
AppProvider appProvider = AppProvider();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  isviewWedWidgetGetStartScreans = sharedPreferences.getInt('getStart-KEY');
  await appProvider.getDarkThemeOrLightTheme();
  Directory directory = await pathProvider.getApplicationDocumentsDirectory();
  Hive.init(directory.path);
  Hive.registerAdapter(ProductsModelAdapter());
  runApp(MyApp(
    appProvider: appProvider,
  ));
}

// ignore: must_be_immutable
class MyApp extends StatelessWidget {
  MyApp({Key? key, required this.appProvider}) : super(key: key);
  AppProvider appProvider = AppProvider();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => SendEmail()),
          ChangeNotifierProvider(create: (context) => FavoriteProvider()),
          ChangeNotifierProvider(create: (context) => DetailProvider()),
          ChangeNotifierProvider(create: (context) => ProductsProvider()),
          ChangeNotifierProvider<OnBoardProvider>(
              create: (context) => OnBoardProvider()),
          ChangeNotifierProvider<AppProvider>(create: (context) => appProvider),
          ChangeNotifierProvider<Repository>(create: (context) => Repository()),
          ChangeNotifierProvider<BottomNavigationBarProvider>(
              create: (context) => BottomNavigationBarProvider()),
        ],
        child: Consumer<AppProvider>(builder: (context, model, child) {
          return MaterialApp(
              theme: ConfigTheme.themeData(model.brighness, context),
              title: 'Flutter shop',
              debugShowCheckedModeBanner: false,
              initialRoute: '/',
              onGenerateRoute: RouteManager.generateRoute,
              home: isviewWedWidgetGetStartScreans != 0
                  ? const OnBoardViews()
                  : const HomeViews());
        }));
  }
}
