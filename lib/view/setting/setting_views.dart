import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/constant.dart';
import 'package:shop/routes/routes.dart';

import 'package:shop/widgets/build_listtitle/build_listtitle.dart';
import '../../provider/app_provider/app_provider.dart';
import '../../widgets/bottom_sheet/appearance_bottomsheet.dart';
import '../../widgets/bottom_sheet/language_bottomsheet.dart';

class SettingViews extends StatelessWidget {
  const SettingViews({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appProvider = Provider.of<AppProvider>(context);
    final textTheme = Theme.of(context).textTheme;

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
          child: SingleChildScrollView(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Account",
                          style: textTheme.subtitle1?.copyWith(fontSize: 18)),
                      const SizedBox(
                        height: 14,
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
                            Row(
                              children: [
                                InkWell(
                                  onTap: () {
                                    Navigator.pushNamed(
                                        context, RouteManager.loginViews);
                                  },
                                  child: Text("Login",
                                      style: textTheme.subtitle1?.copyWith(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w400,
                                          color: kyellow)),
                                ),
                                Text(" / ",
                                    style: textTheme.subtitle1?.copyWith(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w400,
                                        color: kyellow)),
                                InkWell(
                                  onTap: () {
                                    Navigator.pushNamed(
                                        context, RouteManager.signUp);
                                  },
                                  child: Text("Register",
                                      style: textTheme.subtitle1?.copyWith(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w400,
                                          color: kyellow)),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      Text("Settings",
                          style: textTheme.subtitle1?.copyWith(fontSize: 18)),
                      const SizedBox(
                        height: 15,
                      ),
                      BuildListTile(
                        ontap: () {
                          showModalBottomSheet<void>(
                              context: context,
                              builder: (BuildContext context) {
                                return const AppearnaceBottomSheets();
                              });
                        },
                        color: kpurple,
                        icon: appProvider.brighness
                            ? Icons.dark_mode
                            : Icons.light_mode,
                        title: "Appearance",
                        trailing: appProvider.brighness ? "Dark" : "Light",
                        visibilityArrowIcons: true,
                      ),
                      BuildListTile(
                        ontap: () {
                          showModalBottomSheet(
                              context: context,
                              builder: (context) =>
                                  const LanguageBottomSheet());
                        },
                        color: korange,
                        icon: Icons.language,
                        title: "Language",
                        trailing: "English",
                        visibilityArrowIcons: true,
                      ),
                      BuildListTile(
                        ontap: () {
                          Navigator.pushNamed(
                              context, RouteManager.favoriteViews);
                        },
                        color: kred,
                        icon: Icons.favorite,
                        title: "Favorite",
                        trailing: "",
                        visibilityArrowIcons: true,
                      ),
                      BuildListTile(
                        ontap: () {
                          Navigator.of(context)
                              .pushNamed(RouteManager.helpViews);
                        },
                        color: kgreen,
                        icon: Icons.help,
                        title: "Help",
                        trailing: "",
                        visibilityArrowIcons: true,
                      ),
                      BuildListTile(
                        ontap: () {},
                        color: kpink,
                        icon: Icons.logout,
                        title: "Logout",
                        trailing: "",
                        visibilityArrowIcons: true,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ]),
          ),
        ),
      ),
    );
  }
}
