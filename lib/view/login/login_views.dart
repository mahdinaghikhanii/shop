import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/theme/constant.dart';
import 'package:shop/view/signup/signup_views.dart';
import 'package:shop/widgets/input_text/input_text.dart';
import 'package:shop/widgets/small_btmnavigationbar/small_btmnavigationbar.dart';

import '../../provider/app_provider/app_provider.dart';

class LoginViews extends StatelessWidget {
  const LoginViews({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController _nameContoroloer = TextEditingController();
    TextEditingController _passwordContoroler = TextEditingController();
    final appProvider = Provider.of<AppProvider>(context);
    return Scaffold(
      appBar: AppBar(
        foregroundColor: appProvider.brighness ? kwhite : kblackappbar,
        elevation: 0,
      ),
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
                contoroller: _nameContoroloer,
              ),
              const SizedBox(
                height: 15,
              ),
              InputText(
                hintText: 'Enter your password',
                labelText: 'Password',
                contoroller: _passwordContoroler,
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
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
