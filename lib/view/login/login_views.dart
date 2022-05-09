import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../constant.dart';
import '../../main.dart';
import '../../provider/app_provider/app_provider.dart';
import '../../widgets/buttons/small_btmnavigationbar/small_btmnavigationbar.dart';
import '../../widgets/input_text/input_text.dart';
import '../signup/signup_views.dart';

class LoginViews extends StatelessWidget {
  const LoginViews({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController _eamilContoroler = TextEditingController();
    TextEditingController _passwordContoroler = TextEditingController();
    final appProvider = Provider.of<AppProvider>(context);
    return Scaffold(
      appBar: AppBar(
        foregroundColor: appProvider.brighness ? kwhite : kblackappbar,
        elevation: 0,
      ),
      resizeToAvoidBottomInset: false,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 30, right: 30, bottom: 15),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SmallBottomNavigationBar(
                text: 'Sign up',
                ontap: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SignUpViews()));
                },
              ),
              const Spacer(),
              SmallBottomNavigationBar(
                text: 'Forgot Password',
                ontap: () {},
              )
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                ),
                Text('Welcome\nBack',
                    style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.w800,
                        color: appProvider.brighness ? kwhite : kblackappbar)),
                const SizedBox(
                  height: 140,
                ),
                InputText(
                  hintText: 'Enter your username',
                  labelText: 'Username',
                  contoroller: _eamilContoroler,
                  padding: 0,
                  validator: (value) {
                    if (value!.isEmpty || !value.contains('@')) {
                      return 'Invalid email!';
                    }
                    return null;
                  },
                  password: false,
                ),
                const SizedBox(
                  height: 15,
                ),
                InputText(
                  hintText: 'Enter your password',
                  labelText: 'Password',
                  contoroller: _passwordContoroler,
                  padding: 0,
                  validator: (value) {
                    if (value!.isEmpty || !value.contains('@')) {
                      return 'Invalid email!';
                    }
                    return null;
                  },
                  password: true,
                ),
                const SizedBox(
                  height: 25,
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
                        appwriteAuth.login(_eamilContoroler.text,
                            _passwordContoroler.text, context);
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
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
