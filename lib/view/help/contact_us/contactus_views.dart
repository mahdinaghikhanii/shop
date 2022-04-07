import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../constant.dart';
import '../../../repository/send_email.dart';
import '../../../routes/routes.dart';
import '../../../widgets/buttons/button_submit_data/button_submit_data.dart';
import '../../../widgets/input_text/input_text_contactus.dart';

class ContactUsViews extends StatelessWidget {
  const ContactUsViews({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final sendEmailProvider = Provider.of<SendEmail>(context, listen: true);
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
                contoroller: sendEmailProvider.nameTextEdit,
              ),
              InputTextContactUs(
                padding: 20,
                hintText: "Pls write Your Subject",
                labelText: "Subject",
                contoroller: sendEmailProvider.subjectTextEdit,
              ),
              InputTextContactUs(
                padding: 20,
                hintText: "Pls write Your Email",
                labelText: "Email",
                contoroller: sendEmailProvider.emailTextEdit,
              ),
              InputTextContactUs(
                padding: 20,
                hintText: "Pls write Your Message",
                labelText: "Message",
                contoroller: sendEmailProvider.meesageTextEdit,
              ),
              !sendEmailProvider.getshowCircularProgressIndicator
                  ? ButtonSubmitData(ontap: () async {
                      await sendEmailProvider.sendEmail();
                      if (sendEmailProvider.getStatusCode == 200) {
                        AwesomeDialog(
                          context: context,
                          dialogType: DialogType.SUCCES,
                          headerAnimationLoop: true,
                          animType: AnimType.BOTTOMSLIDE,
                          title: 'Done',
                          btnOkColor: kyellow,
                          btnOkText: "Ok",
                          btnCancelColor: kyellow,
                          btnCancelText: "Back home",
                          desc: 'We will answer you as soon as possible :)',
                          buttonsTextStyle: const TextStyle(color: kwhite),
                          showCloseIcon: false,
                          btnCancelOnPress: () {
                            sendEmailProvider.clearTextEdit();
                            sendEmailProvider.setStatusCode(0);
                          },
                          btnOkOnPress: () {
                            sendEmailProvider.setStatusCode(0);
                            Navigator.of(context)
                                .pushReplacementNamed(RouteManager.helpViews);
                            sendEmailProvider.clearTextEdit();
                          },
                        ).show();
                      } else if (sendEmailProvider.getStatusCode == 403) {
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
                            sendEmailProvider.clearTextEdit();
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
                  visible: sendEmailProvider.getcheckTextEdit,
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
