import 'package:flutter/material.dart';

import '../../../generated/l10n.dart';

class AppInfoViews extends StatelessWidget {
  const AppInfoViews({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var multilanguage = S.of(context);
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                multilanguage.appinfo_title_text,
                style: textTheme.subtitle1?.copyWith(fontSize: 30),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(multilanguage.appinfo_versontext + " 1.0.0",
                  style: textTheme.labelLarge
                      ?.copyWith(fontSize: 26, color: Colors.grey.shade500)),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Image.asset(
                  'assets/img/cloth1.png',
                  width: 240,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
