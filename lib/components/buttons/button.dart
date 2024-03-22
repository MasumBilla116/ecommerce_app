import 'package:ecommerce/utils/colors.dart';
import 'package:ecommerce/utils/const.dart';
import 'package:ecommerce/utils/icons.dart';
import 'package:flutter/material.dart';

Widget button({width, height, title, icon, buttonIconColor, buttonTextColor}) {
  return Container(
    width: width,
    height: height,
    decoration: BoxDecoration(
      color: whiteColor,
      borderRadius: BorderRadius.circular(buttonBorderRadious),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        if (icon != null)
          Icon(
            icon,
            color: buttonIconColor,
          ),
        if (title != null)
          Text(
            title,
            style: TextStyle(color: buttonTextColor),
          ),
      ],
    ),
  );
}
