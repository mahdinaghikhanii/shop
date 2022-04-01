import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/theme/constant.dart';

import 'package:shop/view/favorite/Favorite_views.dart';

import '../../provider/app_provider/app_provider.dart';

class SettingViews extends StatelessWidget {
  const SettingViews({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appProvider = Provider.of<AppProvider>(context);
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(Constans.padding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Setting',
                style: Theme.of(context).textTheme.subtitle1,
              ),
              const SizedBox(
                height: 40,
              ),
              Center(
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
              const SizedBox(
                height: 20,
              ),
              InkWell(
                borderRadius: BorderRadius.circular(20),
                highlightColor: appProvider.brighness ? kblack : kwhitemeloo,
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const FavoriteViews()));
                },
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.favorite,
                    ),
                    SizedBox(
                      width: size.width * 0.02,
                    ),
                    const Text('Favorite')
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
