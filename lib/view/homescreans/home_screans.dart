import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/util/repository/repository.dart';

class HomeScreans extends StatelessWidget {
  const HomeScreans({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    final productProvider = Provider.of<Repository>(context);
    return Scaffold(
      body: SafeArea(child: Column()),
    );
  }
}
