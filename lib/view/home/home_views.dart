import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/util/repository/repository.dart';

class HomeScreans extends StatelessWidget {
  const HomeScreans({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List Screans = [];

    // ignore: unused_local_variable
    final productProvider = Provider.of<Repository>(context);
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          leading: Padding(
            padding: const EdgeInsets.only(left: 5),
            child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.person,
                  size: 35,
                  color: Colors.black,
                )),
          )),
      body: SafeArea(child: Column()),
    );
  }
}
