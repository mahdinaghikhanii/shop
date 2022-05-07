import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';
// ignore: library_prefixes
import 'package:path_provider/path_provider.dart' as pathProvider;
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shop/model/products_model/products_model.dart';
import 'package:shop/provider/bottomnavigationbar_provider/bottomnavigationbar_provider.dart';
import 'package:shop/provider/cart_provider/cart_provider.dart';
import 'package:shop/provider/detail_provider/detail_provider.dart';
import 'package:shop/provider/favorite_provider/favorite_provider.dart';
import 'package:shop/provider/onboard_provider/onboard_provider.dart';
import 'package:shop/provider/widget_provider/widget_provider.dart';

import 'package:shop/routes/routes.dart';
import 'package:shop/services/appwrite_auth.dart';
import 'package:shop/services/repository.dart';
import 'package:shop/services/send_email.dart';
import 'package:shop/theme/configtheme.dart';
import 'package:shop/view/home/home_views.dart';
import 'package:shop/view/onboard/onboard_views.dart';
import 'generated/l10n.dart';
import 'model/rating_model/rating_model.dart';
import 'provider/app_provider/app_provider.dart';

int? isviewWedWidgetGetStartScreans;
AppProvider appProvider = AppProvider();
AppwriteAuth appwriteAuth = AppwriteAuth();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Directory directory = await pathProvider.getApplicationDocumentsDirectory();
  Hive.init(directory.path);
  Hive.registerAdapter(ProductsModelAdapter());
  Hive.registerAdapter(RatingModelAdapter());

  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  isviewWedWidgetGetStartScreans = sharedPreferences.getInt('getStart-KEY');
  await appProvider.getDarkThemeOrLightTheme();
  await appProvider.fetchLocale();
  await appwriteAuth.getsaveSignInAndSignUp();
  // await appwriteAuth.logOutAccount();

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
          ChangeNotifierProvider(create: (context) => WidgetProvider()),
          ChangeNotifierProvider(create: (context) => AppwriteAuth()),
          ChangeNotifierProvider(create: (context) => CartProvider()),
          ChangeNotifierProvider(create: (context) => SendEmail()),
          ChangeNotifierProvider(create: (context) => FavoriteProvider()),
          ChangeNotifierProvider(create: (context) => DetailProvider()),
          ChangeNotifierProvider<OnBoardProvider>(
              create: (context) => OnBoardProvider()),
          ChangeNotifierProvider<AppProvider>(create: (context) => appProvider),
          ChangeNotifierProvider<Repository>(create: (context) => Repository()),
          ChangeNotifierProvider<BottomNavigationBarProvider>(
              create: (context) => BottomNavigationBarProvider()),
        ],
        child: Consumer<AppProvider>(builder: (context, model, child) {
          return RefreshConfiguration(
            headerBuilder: () =>
                const WaterDropHeader(), // Configure the default header indicator. If you have the same header indicator for each page, you need to set this
            footerBuilder: () =>
                const ClassicFooter(), // Configure default bottom indicator
            headerTriggerDistance:
                80.0, // header trigger refresh trigger distance
            springDescription: const SpringDescription(
                stiffness: 170,
                damping: 16,
                mass:
                    1.9), // custom spring back animate,the props meaning see the flutter api
            maxOverScrollExtent:
                100, //The maximum dragging range of the head. Set this property if a rush out of the view area occurs
            maxUnderScrollExtent: 0, // Maximum dragging range at the bottom
            enableScrollWhenRefreshCompleted:
                true, //This property is incompatible with PageView and TabBarView. If you need TabBarView to slide left and right, you need to set it to true.
            enableLoadingWhenFailed:
                true, //In the case of load failure, users can still trigger more loads by gesture pull-up.
            hideFooterWhenNotFull:
                false, // Disable pull-up to load more functionality when Viewport is less than one screen
            enableBallisticLoad:
                true, // trigger load more by BallisticScrollActivity

            child: MaterialApp(
                localizationsDelegates: const [
                  S.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                locale: model.language,
                supportedLocales: S.delegate.supportedLocales,
                navigatorObservers: [FlutterSmartDialog.observer],
                builder: FlutterSmartDialog.init(),
                theme: ConfigTheme.themeData(
                    model.brighness, context, model.language),
                title: 'Flutter shop',
                debugShowCheckedModeBanner: false,
                initialRoute: '/',
                onGenerateRoute: RouteManager.generateRoute,
                home: isviewWedWidgetGetStartScreans != 0
                    ? const OnBoardViews()
                    : const HomeViews()),
          );
        }));
  }
}
