import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/theme/constant.dart';
import 'package:shop/util/app_provider/app_provider.dart';

class SettingViews extends StatelessWidget {
  const SettingViews({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appProvider = Provider.of<AppProvider>(context);
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: false,
          title: Text(
            'Setting',
            style: Theme.of(context).textTheme.subtitle1,
          ),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 16, top: 20),
              child: Center(
                  child: Row(
                children: [
                  Icon(appProvider.brighness
                      ? Icons.light_mode
                      : Icons.dark_mode),
                  SizedBox(
                    width: size.width * 0.02,
                  ),
                  Text(appProvider.brighness ? "Light Mood" : "Dark mood"),
                  const Spacer(),
                  Switch(
                    activeColor: kwhite,
                    value: appProvider.brighness,
                    onChanged: (bool? value) {
                      appProvider.brightnessChange = value!;
                    },
                  ),
                ],
              )),
            ),
          ],
        ),
      ),
    );
  }
}
