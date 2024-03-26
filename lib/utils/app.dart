import 'package:ecommerce/utils/colors.dart';
import 'package:ecommerce/utils/navigationMenu.dart';
import 'package:flutter/material.dart';

// app
const appName = "Shopping Mart";
const currency = "Tk";

// login title
Widget loginTitle({Color? textColor = Colors.white, double? fontSize = 15}) {
  return Text(
    "Sign in to shopping mart",
    style: TextStyle(
        fontWeight: FontWeight.bold, color: textColor, fontSize: fontSize),
  );
}

Widget registerTitle({Color? textColor = Colors.white, double? fontSize = 15}) {
  return Text(
    "Sign up in shopping mart",
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
        Icons.arrow_back_ios_outlined,
        color: whiteColor,
      ),
      onPressed: () => back(context),
    ),
  );
}
