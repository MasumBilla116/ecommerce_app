import 'package:ecommerce/language/Language.dart';
import 'package:ecommerce/utils/colors.dart';
import 'package:flutter/material.dart';

Widget showMoreBtn() {
  return ElevatedButton(
    onPressed: () {},
    child: Text(
      Language.load("show_more"),
      style: const TextStyle(color: whiteColor),
    ),
    style: const ButtonStyle(
      backgroundColor: MaterialStatePropertyAll(baseColor),
      elevation: MaterialStatePropertyAll(8),
    ),
  );
}
