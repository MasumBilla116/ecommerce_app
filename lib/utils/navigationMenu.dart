import 'package:ecommerce/pages/Home.dart';
import 'package:ecommerce/pages/auth/Login.dart';
import 'package:ecommerce/pages/auth/Register.dart';
import 'package:flutter/material.dart';

goToHomePage(BuildContext context) {
  Navigator.pushReplacement(
    context,
    MaterialPageRoute(builder: (context) => Home()),
  );
}

goToLoginPage(BuildContext context) {
  Navigator.pushReplacement(
    context,
    MaterialPageRoute(builder: (context) => Login()),
  );
}

goToRegisterPage(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => Register()),
  );
}

back(BuildContext context) {
  Navigator.pop(context);
}
