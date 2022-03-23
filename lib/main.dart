import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/model/products_provider.dart';
import 'package:shop/theme/configtheme.dart';
import 'package:shop/view/getstartScreans/getstart_screans.dart';
import 'package:shop/view/homescreans/home_screans.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ProductsProvider>(
            create: (context) => ProductsProvider()),
      ],
      child: MaterialApp(
        theme: ConfigTheme.themeData(false, context),
        title: 'Flutter shop',
        debugShowCheckedModeBanner: false,
        home: GetStartScreans(),
      ),
    );
  }
}
