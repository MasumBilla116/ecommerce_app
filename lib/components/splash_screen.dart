import 'dart:async';
import 'package:ecommerce/pages/Home.dart';
import 'package:ecommerce/utils/app.dart';
import 'package:ecommerce/utils/colors.dart';
import 'package:ecommerce/utils/const.dart';
import 'package:ecommerce/utils/images.dart';
import 'package:ecommerce/utils/navigationMenu.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreen();
}

class _SplashScreen extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: splashTime), () {
      // goToLoginPage(context);
      goToHomePage(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Container(
              padding: const EdgeInsets.all(50),
              margin: const EdgeInsets.only(top: 150),
              child: shoppingLogo,
            ),
          ),
          const Spacer(),
          const Text(appName,
              style: TextStyle(
                color: Colors.white,
              )),
          const SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }
}
