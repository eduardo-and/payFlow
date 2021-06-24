import 'package:flutter/material.dart';
import 'package:payflow/modules/barcode_scanner/barcode_scanner_page.dart';
import 'package:payflow/modules/home/home_page.dart';
import 'package:payflow/modules/login/login_page.dart';
import 'modules/splash/splash_page.dart';
import 'shared/themes/app_colors.dart';

class AppWidget extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(primaryColor: AppColors.primary),
        initialRoute: "/splash",
        routes: {
          "/splash": (context) => SplashPage(),
          "/login": (context) => LoginPage(),
          "/home": (context) => HomePage(),
          "/barcode_scanner": (context) => BarcodeScanner()
        });
  }
}
