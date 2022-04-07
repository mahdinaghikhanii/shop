import 'package:flutter/material.dart';

class AppInfoViews extends StatelessWidget {
  const AppInfoViews({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Onlin Shop !',
                style: textTheme.subtitle1?.copyWith(fontSize: 30),
              ),
              const SizedBox(
                height: 10,
              ),
              Text("Version 1.0.0",
                  style: textTheme.labelLarge
                      ?.copyWith(fontSize: 26, color: Colors.grey.shade500)),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Image.asset(
                  'assets/img/cloth1.png',
                  width: 240,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
