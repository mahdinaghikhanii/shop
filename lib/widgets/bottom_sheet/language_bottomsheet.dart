import 'package:flutter/material.dart';
import 'package:shop/constant.dart';
import 'package:shop/main.dart';

class LanguageBottomSheet extends StatelessWidget {
  const LanguageBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Container(
      padding: const EdgeInsets.all(
        Constans.padding,
      ),
      height: 260,
      decoration: BoxDecoration(
          color: appProvider.brighness
              ? Colors.grey.shade900
              : Colors.grey.shade200,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          )),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Select a Language",
            style: textTheme.headline1?.copyWith(fontSize: 18),
          ),
          const SizedBox(height: 32),
          ListTile(
            leading: const Icon(
              Icons.language_rounded,
              color: Colors.blue,
            ),
            title: Text("English", style: textTheme.bodyText1),
            onTap: () {
              appProvider.setLanguage('en');
              Navigator.pop(context);
            },
            trailing: Icon(
              Icons.check,
              color: appProvider.language == const Locale('en')
                  ? Colors.blue
                  : Colors.transparent,
            ),
          ),
          const SizedBox(height: 16),
          ListTile(
            leading: const Icon(
              Icons.language,
              color: Colors.orange,
            ),
            title: Text(
              "قارسی",
              style: textTheme.bodyText1?.copyWith(fontFamily: ""),
            ),
            onTap: () {
              appProvider.setLanguage('fa');
              Navigator.pop(context);
            },
            trailing: Icon(
              Icons.check,
              color: appProvider.language == const Locale('fa')
                  ? Colors.orange
                  : Colors.transparent,
            ),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
