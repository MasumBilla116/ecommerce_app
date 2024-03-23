import 'package:ecommerce/utils/colors.dart';
import 'package:ecommerce/utils/const.dart';
import 'package:ecommerce/utils/icons.dart';
import 'package:flutter/material.dart';

Widget button(
    {width,
    height,
    marginLeft = 0.0,
    marginRight = 0.0,
    title,
    icon,
    imagePath,
    buttonIconColor,
    buttonTextColor}) {
  return Container(
    width: width,
    height: height,
    margin: EdgeInsets.only(left: marginLeft, right: marginRight),
    padding: EdgeInsets.all(10),
    decoration: BoxDecoration(
      color: whiteColor,
      borderRadius: BorderRadius.circular(buttonBorderRadious),
    ),
    child: imagePath != null
        ? Row(
            children: [
              if (imagePath != null) Image.asset(imagePath),
              if (title != null)
                Text(
                  title,
                  style: TextStyle(
                      color: buttonTextColor, fontWeight: FontWeight.bold),
                ),
            ],
          )
        : Column(
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
