import 'package:ecommerce/utils/colors.dart';
import 'package:flutter/material.dart';

Widget IconButtonComponent(bgColor, icon) {
  return ElevatedButton(
    onPressed: () {},
    child: icon,
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all(bgColor),
      elevation: MaterialStateProperty.all(0),
      padding: MaterialStateProperty.all(
        EdgeInsets.zero,
      ),
      shape: MaterialStateProperty.all(
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
      ),
    ),
  );
}
