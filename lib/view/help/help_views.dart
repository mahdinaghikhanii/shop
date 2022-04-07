import 'package:flutter/material.dart';
import 'package:shop/constant.dart';
import 'package:shop/routes/routes.dart';
import 'package:shop/widgets/build_listtitle/build_listtitle.dart';

class HelpViews extends StatelessWidget {
  const HelpViews({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        centerTitle: false,
        titleSpacing: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: theme.bottomAppBarColor,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Padding(
          padding: const EdgeInsets.only(
            left: Constans.padding,
          ),
          child: Text(
            'Help',
            style: Theme.of(context).textTheme.subtitle1,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(Constans.padding),
        child: Column(
          children: [
            BuildListTile(
              ontap: () {},
              color: grey,
              icon: Icons.help,
              title: "Help Centre",
              trailing: '',
              visibilityArrowIcons: false,
            ),
            BuildListTile(
              ontap: () {
                Navigator.pushNamed(context, RouteManager.contactUs);
              },
              color: grey,
              icon: Icons.contact_mail,
              title: "Contact us",
              trailing: '',
              visibilityArrowIcons: false,
            ),
            BuildListTile(
              ontap: () {},
              color: grey,
              icon: Icons.info,
              title: "App info",
              trailing: '',
              visibilityArrowIcons: false,
            )
          ],
        ),
      ),
    );
  }
}
