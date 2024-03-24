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
