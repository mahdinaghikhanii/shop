// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shop/util/app_provider/app_provider.dart';
import 'package:shop/util/repository/repository.dart';
import 'package:shop/theme/configtheme.dart';
import 'package:shop/view/getstart/getstart_views.dart';
import 'package:shop/view/home/home_views.dart';

int? isviewWedWidgetGetStartScreans;
AppProvider appProvider = AppProvider();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  isviewWedWidgetGetStartScreans = sharedPreferences.getInt('getStart-KEY');
  await appProvider.getDarkThemeOrLightTheme();
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
          ChangeNotifierProvider<AppProvider>(
              create: (
            context,
          ) =>
                  appProvider),
          ChangeNotifierProvider<Repository>(create: (context) => Repository()),
        ],
        child: Consumer<AppProvider>(builder: (context, model, child) {
          return MaterialApp(
              theme: ConfigTheme.themeData(model.brighness, context),
              title: 'Flutter shop',
              debugShowCheckedModeBanner: false,
              home: isviewWedWidgetGetStartScreans != 0
                  ? const GetStartScreans()
                  : const HomeScreans());
        }));
  }
}
