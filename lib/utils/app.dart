import 'package:ecommerce/utils/colors.dart';
import 'package:ecommerce/utils/icons.dart';
import 'package:ecommerce/utils/navigationMenu.dart';
import 'package:flutter/material.dart';

// app
const appName = "Bonu Shop";
const currency = "Tk";

// login title
Widget loginTitle({Color? textColor = Colors.white, double? fontSize = 15}) {
  return Text(
    "Sign in to Bonu Shop",
    style: TextStyle(
        fontWeight: FontWeight.bold, color: textColor, fontSize: fontSize),
  );
}

Widget registerTitle({Color? textColor = Colors.white, double? fontSize = 15}) {
  return Text(
    "Sign up in Bonu Shop",
    style: TextStyle(
        fontWeight: FontWeight.bold, color: textColor, fontSize: fontSize),
  );
}

// app bar with leading
PreferredSizeWidget? appBarWithLeading(String title, BuildContext context) {
  return AppBar(
    title: Text(title),
    titleTextStyle: const TextStyle(
        color: whiteColor, fontSize: 20, fontWeight: FontWeight.bold),
    leading: IconButton(
      icon: const Icon(
        onlyArrowTurnUpLeftIcon,
        color: whiteColor,
      ),
      onPressed: () => back(context),
    ),
  );
}
