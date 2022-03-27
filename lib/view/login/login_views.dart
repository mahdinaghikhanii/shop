import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/theme/constant.dart';
import 'package:shop/util/app_provider/app_provider.dart';
import 'package:shop/widgets/input_text/input_text.dart';
import 'package:shop/widgets/small_btmnavigationbar/small_btmnavigationbar.dart';

class LoginViews extends StatelessWidget {
  const LoginViews({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appProvider = Provider.of<AppProvider>(context);
    return Scaffold(
      appBar: AppBar(
        foregroundColor: appProvider.brighness ? kwhite : kblackappbar,
        elevation: 0,
      ),
      floatingActionButton: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: const [
            SmallBottomNavigationBar(
              text: 'Sign Up',
            ),
            SmallBottomNavigationBar(
              text: 'Forgot Passwords',
            )
          ],
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
                height: 160,
              ),
              const InputText(
                hintText: 'Enter your username',
                labelText: 'Username',
              ),
              const SizedBox(
                height: 20,
              ),
              const InputText(
                hintText: 'Enter your password',
                labelText: 'Password',
              ),
              const SizedBox(
                height: 30,
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
