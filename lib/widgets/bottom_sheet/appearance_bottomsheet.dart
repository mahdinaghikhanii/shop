import 'package:flutter/material.dart';
import 'package:shop/constant.dart';
import 'package:shop/generated/l10n.dart';
import 'package:shop/main.dart';

class AppearnaceBottomSheets extends StatelessWidget {
  const AppearnaceBottomSheets({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    var multilanguage = S.of(context);

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
            "Select a Theme",
            style: textTheme.headline1?.copyWith(fontSize: 18),
          ),
          const SizedBox(height: 32),
          ListTile(
            leading: const Icon(
              Icons.brightness_5,
              color: Colors.blue,
            ),
            title: Text(multilanguage.bottomsheet_btnText_light,
                style: textTheme.bodyText1),
            onTap: () {
              appProvider.brightnessChange = false;
              Navigator.pop(context);
            },
            trailing: Icon(
              Icons.check,
              color: appProvider.brighness == false
                  ? Colors.blue
                  : Colors.transparent,
            ),
          ),
          const SizedBox(height: 16),
          ListTile(
            leading: const Icon(
              Icons.brightness_2,
              color: Colors.orange,
            ),
            title: Text(multilanguage.bottomsheet_btnText_dark,
                style: textTheme.bodyText1),
            onTap: () {
              appProvider.brightnessChange = true;
              Navigator.pop(context);
            },
            trailing: Icon(
              Icons.check,
              color: appProvider.brighness == true
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
