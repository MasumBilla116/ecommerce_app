import 'package:ecommerce/pages/Home.dart';
import 'package:ecommerce/pages/auth/Login.dart';
import 'package:ecommerce/pages/auth/Register.dart';
import 'package:flutter/material.dart';

goToHomePage(context) {
  Navigator.pushReplacement(
    context,
    MaterialPageRoute(builder: (context) => Login()),
  );
}

goToRegisterPage(context) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => Register()),
  );
}

goToLoginPage(context) {
  Navigator.pushReplacement(
    context,
    MaterialPageRoute(builder: (context) => Login()),
  );
}
