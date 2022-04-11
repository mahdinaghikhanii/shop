import 'package:flutter/material.dart';
import 'package:shop/constant.dart';

class ConfigTheme {
  static String faPrimaryFontFamily = 'IranYekan';
  late final Color scafoldColor;
  late final Brightness brightness;

  ConfigTheme.light() {
    return;
  }
  static ThemeData themeData(
      bool isDarkTheme, BuildContext context, Locale language) {
    return ThemeData(
      textTheme: TextTheme(
          labelMedium: const TextStyle(fontSize: 18, color: grey),
          headline1: TextStyle(
              fontFamily:
                  language == const Locale('en') ? "" : faPrimaryFontFamily,
              fontSize: 24,
              color: isDarkTheme ? kwhite : kblack,
              fontWeight: FontWeight.normal),
          headline2: TextStyle(
              fontFamily:
                  language == const Locale('en') ? "" : faPrimaryFontFamily,
              fontSize: 20,
              color: isDarkTheme ? kwhite : kblack,
              fontWeight: FontWeight.normal),
          headline3: TextStyle(
              fontFamily:
                  language == const Locale('en') ? "" : faPrimaryFontFamily,
              fontSize: 24,
              color: isDarkTheme ? kwhite : Colors.black,
              fontWeight: FontWeight.bold),
          headline4: TextStyle(
              fontFamily:
                  language == const Locale('en') ? "" : faPrimaryFontFamily,
              fontSize: 14,
              color: isDarkTheme ? kwhite : kblack),
          headline6: TextStyle(
              fontSize: 20,
              fontFamily:
                  language == const Locale('en') ? "" : faPrimaryFontFamily,
              color: isDarkTheme ? kwhite : kblack,
              fontWeight: FontWeight.bold),
          bodyText1: TextStyle(
            fontSize: 16,
            color: isDarkTheme ? kwhite : kblack,
            fontFamily:
                language == const Locale('en') ? "" : faPrimaryFontFamily,
          ),
          subtitle1: TextStyle(
              fontFamily:
                  language == const Locale('en') ? "" : faPrimaryFontFamily,
              color: isDarkTheme ? kwhite : kblackappbar,
              fontSize: 24,
              fontWeight: FontWeight.bold),
          subtitle2: TextStyle(
              fontFamily:
                  language == const Locale('en') ? "" : faPrimaryFontFamily,
              color: isDarkTheme ? kwhite : kwhite,
              fontWeight: FontWeight.bold,
              fontSize: 18),
          button: TextStyle(
              fontFamily:
                  language == const Locale('en') ? "" : faPrimaryFontFamily,
              color: isDarkTheme ? kwhite : kblack,
              fontSize: Constans.fontButtonSisze),
          caption: TextStyle(
              fontFamily:
                  language == const Locale('en') ? "" : faPrimaryFontFamily,
              fontSize: 16,
              color: isDarkTheme ? kwhite : kblack,
              height: 1.5),
          headlineLarge: TextStyle(
              fontFamily:
                  language == const Locale('en') ? "" : faPrimaryFontFamily,
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: korange),
          headline5: TextStyle(
              fontFamily:
                  language == const Locale('en') ? "" : faPrimaryFontFamily,
              fontWeight: FontWeight.bold,
              fontSize: 34,
              color: isDarkTheme ? kwhite : kblack)),
      primaryColor: isDarkTheme ? Colors.black : kwhite,
      backgroundColor: isDarkTheme ? Colors.black : kwhite,
      bottomAppBarColor: isDarkTheme ? kwhite : kblackappbar,
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
