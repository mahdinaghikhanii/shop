import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/theme/constant.dart';
import 'package:shop/util/app_provider/app_provider.dart';
import 'package:shop/view/login/login_views.dart';
import 'package:shop/widgets/input_text/input_text.dart';
import 'package:shop/widgets/small_btmnavigationbar/small_btmnavigationbar.dart';

class SignUpViews extends StatelessWidget {
  const SignUpViews({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appProvider = Provider.of<AppProvider>(context);
    return Scaffold(
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
              const InputText(
                hintText: 'Enter your name',
                labelText: 'Name',
              ),
              const SizedBox(
                height: 15,
              ),
              const InputText(
                hintText: 'Enter your Email',
                labelText: 'Email',
              ),
              const SizedBox(
                height: 15,
              ),
              const InputText(
                hintText: 'Enter your password',
                labelText: 'Password',
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
                    Container(
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
                          color: appProvider.brighness ? kblackappbar : kwhite,
                        ),
                      ),
                    )
                  ])
            ])),
      ),
    );
  }
}