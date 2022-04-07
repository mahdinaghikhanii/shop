import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/constant.dart';
import 'package:shop/repository/send_email.dart';
import 'package:shop/routes/routes.dart';
import 'package:shop/widgets/build_listtitle/build_listtitle.dart';
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
    final product = Provider.of<SendEmail>(context, listen: true);
    final textTheme = Theme.of(context).textTheme;

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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(Constans.padding),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              Column(
                children: [
                  Image.asset(
                    'assets/img/contactus.png',
                    width: 160,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: Constans.padding),
                    child: Text(
                      'Tell us how we can help !',
                      style: textTheme.headline3,
                    ),
                  )
                ],
              ),
              const SizedBox(height: Constans.smallSizedBox),
              InputTextContactUs(
                padding: 20,
                hintText: "Pls write Your name",
                labelText: "Name",
                contoroller: product.nameTextEdit,
              ),
              InputTextContactUs(
                padding: 20,
                hintText: "Pls write Your Subject",
                labelText: "Subject",
                contoroller: product.subjectTextEdit,
              ),
              InputTextContactUs(
                padding: 20,
                hintText: "Pls write Your Email",
                labelText: "Email",
                contoroller: product.emailTextEdit,
              ),
              InputTextContactUs(
                padding: 20,
                hintText: "Pls write Your Message",
                labelText: "Message",
                contoroller: product.meesageTextEdit,
              ),
              !product.getshowCircularProgressIndicator
                  ? ButtonSubmitData(ontap: () async {
                      await product.sendEmail();
                      if (product.getStatusCode == 200) {
                        AwesomeDialog(
                          context: context,
                          dialogType: DialogType.SUCCES,
                          headerAnimationLoop: true,
                          animType: AnimType.BOTTOMSLIDE,
                          title: 'Done',
                          btnCancelText: "Thanks !",
                          btnOkColor: kred,
                          btnOkText: "Ok",
                          btnCancelColor: kyellow,
                          desc: 'We have Problems try agin pls !',
                          buttonsTextStyle:
                              const TextStyle(color: Colors.black),
                          showCloseIcon: true,
                          btnCancelOnPress: () {
                            product.clearTextEdit();
                            product.setStatusCode(0);
                          },
                          btnOkOnPress: () {
                            product.setStatusCode(0);
                            Navigator.of(context)
                                .pushReplacementNamed(RouteManager.helpViews);
                            product.clearTextEdit();
                          },
                        ).show();
                      } else if (product.getStatusCode == 403) {
                        AwesomeDialog(
                          context: context,
                          dialogType: DialogType.ERROR,
                          headerAnimationLoop: true,
                          animType: AnimType.BOTTOMSLIDE,
                          title: 'Erorr !',
                          btnCancelText: "Retry",
                          btnOkColor: kred,
                          btnOkText: "Ok",
                          btnCancelColor: kyellow,
                          desc: 'We have Problems try agin pls !',
                          buttonsTextStyle:
                              const TextStyle(color: Colors.black),
                          showCloseIcon: true,
                          btnCancelOnPress: () {},
                          btnOkOnPress: () {
                            Navigator.of(context)
                                .pushNamed(RouteManager.helpViews);
                            product.clearTextEdit();
                          },
                        ).show();
                      }
                    })
                  : const Center(
                      child: CircularProgressIndicator(
                        color: kyellow,
                      ),
                    ),
              Visibility(
                  visible: product.getcheckTextEdit,
                  child: Text('Please enter the information',
                      style: Theme.of(context)
                          .textTheme
                          .labelMedium
                          ?.copyWith(color: kred))),
            ],
          ),
        ),
      ),
    );
  }
}
