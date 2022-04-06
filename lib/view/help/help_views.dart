import 'package:flutter/material.dart';
import 'package:shop/constant.dart';
import 'package:shop/routes/routes.dart';
import 'package:shop/widgets/build_listtitle/build_listtitle.dart';
import 'package:shop/widgets/input_text/input_text.dart';
import 'package:shop/widgets/input_text/input_text_contactus.dart';

import '../../widgets/buttons/button_submit_data/button_submit_data.dart';

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

class ContactUs extends StatelessWidget {
  const ContactUs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    TextEditingController _email = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        centerTitle: false,
        titleSpacing: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios,
              color: Theme.of(context).bottomAppBarColor),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Padding(
          padding: const EdgeInsets.only(
            left: Constans.padding,
          ),
          child: Text(
            'Contact us',
            style: Theme.of(context).textTheme.subtitle1,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(Constans.padding),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              height: 60,
            ),
            Column(
              children: [
                Image.asset(
                  'assets/img/contactus.png',
                  width: 200,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: Constans.padding),
                  child: Text(
                    'Contact us',
                    style: textTheme.headline3,
                  ),
                )
              ],
            ),
            const SizedBox(height: Constans.smallSizedBox),
            InputTextContactUs(
                padding: 20,
                hintText: "",
                labelText: "Tell us how we can help",
                contoroller: _email),
            ButtonSubmitData(
              ontap: () {},
            )
          ],
        ),
      ),
    );
  }
}
