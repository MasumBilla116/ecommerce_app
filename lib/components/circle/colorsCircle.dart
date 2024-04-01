import 'package:ecommerce/utils/colors.dart';
import 'package:flutter/material.dart';

Widget ColorsCircle(mainColor, opacityColor) {
  return CircleAvatar(
    maxRadius: 12,
    backgroundColor: opacityColor,
    child: Container(
      width: 17,
      height: 17,
      decoration: BoxDecoration(
          color: mainColor, borderRadius: BorderRadius.circular(100)),
    ),
  );
}
