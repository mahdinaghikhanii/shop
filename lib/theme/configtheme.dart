import 'package:flutter/material.dart';
import 'package:shop/theme/constant.dart';

class ConfigTheme {
  String faPrimaryFontFamily = "IranYekan";
  late final Color scafoldColor;
  late final Brightness brightness;

  ConfigTheme.light() {
    return;
  }
  static ThemeData themeData(bool isDarkTheme, BuildContext context) {
    return ThemeData(
      textTheme: TextTheme(
          headline1: TextStyle(
              fontSize: 24,
              color: isDarkTheme ? kwhite : kblack,
              fontWeight: FontWeight.normal),
          headline2: TextStyle(
              fontSize: 20,
              color: isDarkTheme ? kwhite : kblack,
              fontWeight: FontWeight.normal),
          headline4:
              TextStyle(fontSize: 14, color: isDarkTheme ? kwhite : kblack),
          headline6: TextStyle(
              fontSize: 14,
              color: isDarkTheme ? kwhite : kblack,
              fontWeight: FontWeight.bold),
          bodyText1:
              TextStyle(fontSize: 16, color: isDarkTheme ? kwhite : kblack),
          subtitle1: TextStyle(
              color: isDarkTheme ? kwhite : kblack,
              fontSize: 24,
              fontWeight: FontWeight.bold),
          subtitle2: TextStyle(
              color: isDarkTheme ? kwhite : kwhite,
              fontWeight: FontWeight.bold,
              fontSize: 18),
          button: TextStyle(
              color: isDarkTheme ? kwhite : kblack,
              fontSize: Constans.fontButtonSisze),
          caption:
              TextStyle(fontSize: 20, color: isDarkTheme ? kwhite : kblack),
          headlineLarge: const TextStyle(
              fontWeight: FontWeight.bold, fontSize: 20, color: korange),
          headline5: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 34,
              color: isDarkTheme ? kwhite : kblack)),
      primaryColor: isDarkTheme ? Colors.black : kwhite,
      backgroundColor: isDarkTheme ? Colors.black : kwhite,
      scaffoldBackgroundColor: isDarkTheme ? kblack : kwhite,
      indicatorColor:
          isDarkTheme ? const Color(0xff0E1D36) : const Color(0xffCBDCF8),
      hintColor: isDarkTheme ? grey : grey,
      highlightColor: isDarkTheme ? const Color(0xff372901) : grey,
      hoverColor:
          isDarkTheme ? const Color(0xff3A3A3B) : const Color(0xff4285F4),
      focusColor:
          isDarkTheme ? const Color(0xff0B2512) : const Color(0xffA8DAB5),
      appBarTheme: AppBarTheme(backgroundColor: isDarkTheme ? kblack : kwhite),
      disabledColor: Colors.grey,
      cardColor: isDarkTheme ? const Color(0xFF151515) : Colors.white,
      canvasColor: isDarkTheme ? Colors.black : Colors.grey[50],
      brightness: isDarkTheme ? Brightness.dark : Brightness.light,
      buttonTheme: Theme.of(context).buttonTheme.copyWith(
          colorScheme: isDarkTheme
              ? const ColorScheme.dark()
              : const ColorScheme.light()),
    );
  }

  TextTheme get enPrimaryTextTheme => const TextTheme(
      button: TextStyle(color: kwhite, fontSize: Constans.fontButtonSisze),
      bodyText1: TextStyle(fontSize: 14, color: grey),
      headline6:
          TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: kblack),
      headline5:
          TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: korange));

  TextTheme get faPrimaryTextTheme => const TextTheme();
}
