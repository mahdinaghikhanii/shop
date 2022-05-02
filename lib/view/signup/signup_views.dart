import 'package:appwrite/appwrite.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/constant.dart';
import 'package:shop/services/appwrite_auth.dart';
import 'package:shop/view/home/home_views.dart';
import 'package:shop/view/login/login_views.dart';
import 'package:shop/widgets/input_text/input_text.dart';
import '../../provider/app_provider/app_provider.dart';
import '../../widgets/buttons/small_btmnavigationbar/small_btmnavigationbar.dart';

class SignUpViews extends StatelessWidget {
  const SignUpViews({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final service = Provider.of<AppwriteAuth>(context);
    //
    TextEditingController _nameContoroloer = TextEditingController();
    TextEditingController _emailContoroller = TextEditingController();
    TextEditingController _passwordContoroller = TextEditingController();
    final appProvider = Provider.of<AppProvider>(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(left: 12),
        child: SmallBottomNavigationBar(
          text: 'Sign in',
          ontap: () {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => const LoginViews()));
          },
        ),
      ),
      appBar: AppBar(
        foregroundColor: appProvider.brighness ? kwhite : kblackappbar,
        elevation: 0,
      ),
      body: SafeArea(
        child: Padding(
            padding: const EdgeInsets.all(30),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const SizedBox(
                height: 20,
              ),
              Text('Create\nAccount',
                  style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.w800,
                      color: appProvider.brighness ? kwhite : kblackappbar)),
              const SizedBox(
                height: 40,
              ),
              InputText(
                hintText: 'Enter your name',
                labelText: 'Name',
                contoroller: _nameContoroloer,
                padding: 0,
              ),
              const SizedBox(
                height: 15,
              ),
              InputText(
                hintText: 'Enter your Email',
                labelText: 'Email',
                contoroller: _emailContoroller,
                padding: 0,
              ),
              const SizedBox(
                height: 15,
              ),
              InputText(
                hintText: 'Enter your password',
                labelText: 'Password',
                contoroller: _passwordContoroller,
                padding: 0,
              ),
              const SizedBox(
                height: 60,
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Sign in',
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                    InkWell(
                      borderRadius:
                          BorderRadius.circular(Constans.mediumBorderRadios),
                      onTap: () async {
                        final client = context.read<AppwriteAuth>().client;
                        final account = Account(client);
                        try {
                          var respone = await account.create(
                              name: _nameContoroloer.text,
                              userId: 'unique()',
                              email: _emailContoroller.text,
                              password: _passwordContoroller.text);
                          if (respone.status == true) {
                            service.setsSaveSignInAndSignUp(
                                true, _nameContoroloer.text);
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const HomeViews()));
                          }
                        } on AppwriteException catch (e) {
                          print(e.message);
                          // Account already exists
                          if (e.code == 409) {}
                        }
                      },
                      child: Container(
                        height: 80,
                        width: 80,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: appProvider.brighness ? kwhite : kblackappbar,
                        ),
                        child: Center(
                          child: Icon(
                            Icons.arrow_right_alt_outlined,
                            size: 45,
                            color:
                                appProvider.brighness ? kblackappbar : kwhite,
                          ),
                        ),
                      ),
                    )
                  ])
            ])),
      ),
    );
  }
}
