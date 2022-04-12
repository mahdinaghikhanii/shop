// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Home`
  String get naemBtnNavigationInHomeViews_Home {
    return Intl.message(
      'Home',
      name: 'naemBtnNavigationInHomeViews_Home',
      desc: '',
      args: [],
    );
  }

  /// `Cart`
  String get naemBtnNavigationInHomeViews_Cart {
    return Intl.message(
      'Cart',
      name: 'naemBtnNavigationInHomeViews_Cart',
      desc: '',
      args: [],
    );
  }

  /// `Setting`
  String get naemBtnNavigationInHomeViews_Setting_andAppbarSetting {
    return Intl.message(
      'Setting',
      name: 'naemBtnNavigationInHomeViews_Setting_andAppbarSetting',
      desc: '',
      args: [],
    );
  }

  /// `Account`
  String get setting_Text_Account {
    return Intl.message(
      'Account',
      name: 'setting_Text_Account',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get setting_button_login {
    return Intl.message(
      'Login',
      name: 'setting_button_login',
      desc: '',
      args: [],
    );
  }

  /// `Register`
  String get setting_button_register {
    return Intl.message(
      'Register',
      name: 'setting_button_register',
      desc: '',
      args: [],
    );
  }

  /// `Appearance`
  String get setting_Listtitle_appearance {
    return Intl.message(
      'Appearance',
      name: 'setting_Listtitle_appearance',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get setting_Listtile_Language {
    return Intl.message(
      'Language',
      name: 'setting_Listtile_Language',
      desc: '',
      args: [],
    );
  }

  /// `Favorite`
  String get setting_Listtile_Favorite {
    return Intl.message(
      'Favorite',
      name: 'setting_Listtile_Favorite',
      desc: '',
      args: [],
    );
  }

  /// `Help`
  String get setting_Listtile_Help {
    return Intl.message(
      'Help',
      name: 'setting_Listtile_Help',
      desc: '',
      args: [],
    );
  }

  /// `Logout`
  String get setting_Listtile_Logout {
    return Intl.message(
      'Logout',
      name: 'setting_Listtile_Logout',
      desc: '',
      args: [],
    );
  }

  /// `about developer`
  String get setting_linktext_aboutdeveloper {
    return Intl.message(
      'about developer',
      name: 'setting_linktext_aboutdeveloper',
      desc: '',
      args: [],
    );
  }

  /// `Light`
  String get bottomsheet_btnText_light {
    return Intl.message(
      'Light',
      name: 'bottomsheet_btnText_light',
      desc: '',
      args: [],
    );
  }

  /// `Dark`
  String get bottomsheet_btnText_dark {
    return Intl.message(
      'Dark',
      name: 'bottomsheet_btnText_dark',
      desc: '',
      args: [],
    );
  }

  /// `All`
  String get home_buildchip_text_All {
    return Intl.message(
      'All',
      name: 'home_buildchip_text_All',
      desc: '',
      args: [],
    );
  }

  /// `Men`
  String get home_buildchip_text_men {
    return Intl.message(
      'Men',
      name: 'home_buildchip_text_men',
      desc: '',
      args: [],
    );
  }

  /// `Woman`
  String get home_buildchip_text_woman {
    return Intl.message(
      'Woman',
      name: 'home_buildchip_text_woman',
      desc: '',
      args: [],
    );
  }

  /// `Jewelry`
  String get home_buildchip_text_jewelry {
    return Intl.message(
      'Jewelry',
      name: 'home_buildchip_text_jewelry',
      desc: '',
      args: [],
    );
  }

  /// `The most popular`
  String get home_buoldchip_text_Themostpopular {
    return Intl.message(
      'The most popular',
      name: 'home_buoldchip_text_Themostpopular',
      desc: '',
      args: [],
    );
  }

  /// `today And the moon`
  String get home_buildchip_text_clothestoday {
    return Intl.message(
      'today And the moon',
      name: 'home_buildchip_text_clothestoday',
      desc: '',
      args: [],
    );
  }

  /// `Help center`
  String get help_listttile_text_helpcenter {
    return Intl.message(
      'Help center',
      name: 'help_listttile_text_helpcenter',
      desc: '',
      args: [],
    );
  }

  /// `Contact us`
  String get help_listttile_textcontactus {
    return Intl.message(
      'Contact us',
      name: 'help_listttile_textcontactus',
      desc: '',
      args: [],
    );
  }

  /// `App info`
  String get help_listttile_textappinfo {
    return Intl.message(
      'App info',
      name: 'help_listttile_textappinfo',
      desc: '',
      args: [],
    );
  }

  /// `Onlin Shop`
  String get appinfo_title_text {
    return Intl.message(
      'Onlin Shop',
      name: 'appinfo_title_text',
      desc: '',
      args: [],
    );
  }

  /// `Version`
  String get appinfo_versontext {
    return Intl.message(
      'Version',
      name: 'appinfo_versontext',
      desc: '',
      args: [],
    );
  }

  /// `Tell us how we can help !`
  String get contactus_titletext_tellUs {
    return Intl.message(
      'Tell us how we can help !',
      name: 'contactus_titletext_tellUs',
      desc: '',
      args: [],
    );
  }

  /// `Contact us`
  String get contactus_appbar_text {
    return Intl.message(
      'Contact us',
      name: 'contactus_appbar_text',
      desc: '',
      args: [],
    );
  }

  /// `name`
  String get contactus_inputtext_name {
    return Intl.message(
      'name',
      name: 'contactus_inputtext_name',
      desc: '',
      args: [],
    );
  }

  /// `Subject`
  String get contactus_inputtext_subject {
    return Intl.message(
      'Subject',
      name: 'contactus_inputtext_subject',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get contactus_inputtext_email {
    return Intl.message(
      'Email',
      name: 'contactus_inputtext_email',
      desc: '',
      args: [],
    );
  }

  /// `Message`
  String get contactus_inputtext_message {
    return Intl.message(
      'Message',
      name: 'contactus_inputtext_message',
      desc: '',
      args: [],
    );
  }

  /// `Send !`
  String get contactus_btntext_send {
    return Intl.message(
      'Send !',
      name: 'contactus_btntext_send',
      desc: '',
      args: [],
    );
  }

  /// `You have no\nFavorite :(`
  String get favorite_text_nowhavecart {
    return Intl.message(
      'You have no\nFavorite :(',
      name: 'favorite_text_nowhavecart',
      desc: '',
      args: [],
    );
  }

  /// `You have no\nCart :(`
  String get cart_text_nowhavecart {
    return Intl.message(
      'You have no\nCart :(',
      name: 'cart_text_nowhavecart',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'fa'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
