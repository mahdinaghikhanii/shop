import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/constant.dart';

import 'package:shop/view/favorite/Favorite_views.dart';
import 'package:shop/widgets/build_listtitle/build_listtitle.dart';

import '../../provider/app_provider/app_provider.dart';

class SettingViews extends StatelessWidget {
  const SettingViews({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appProvider = Provider.of<AppProvider>(context);
    final size = MediaQuery.of(context).size;
    final textTheme = Theme.of(context).textTheme;
    final theme = Theme.of(context);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Padding(
            padding: const EdgeInsets.all(Constans.padding),
            child: Text(
              'Settings',
              style: Theme.of(context).textTheme.subtitle1,
            ),
          ),
          centerTitle: false,
          titleSpacing: 0,
          elevation: 0,
        ),
        body: Padding(
          padding: const EdgeInsets.all(Constans.padding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BuildListTile(
                  ontap: () {},
                  color: korange,
                  icon: Icons.language,
                  title: "Language",
                  trailing: "English"),
              Text("Account",
                  style: textTheme.headline6
                      ?.copyWith(fontWeight: FontWeight.w400, fontSize: 20)),
              const SizedBox(
                height: 10,
              ),
              Container(
                height: 80,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: appProvider.brighness
                        ? Colors.grey.shade400.withAlpha(100)
                        : Colors.grey.shade200),
                child: Row(
                  children: [
                    Container(
                      width: 52,
                      height: 52,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: appProvider.brighness
                              ? Colors.grey.shade700
                              : Colors.grey.shade300),
                      child: Center(
                        child: Icon(Icons.person,
                            size: 32, color: Colors.grey.shade500),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Text("Login / Register",
                        style: textTheme.subtitle1?.copyWith(
                            fontWeight: FontWeight.w400, color: kyellow)),
                  ],
                ),
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
                  Text(
                    appProvider.brighness ? "Light Mood" : "Dark mood",
                  ),
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
