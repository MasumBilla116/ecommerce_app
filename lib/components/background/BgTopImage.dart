import 'package:ecommerce/utils/colors.dart';
// import 'package:ecommerce/utils/images.dart';
import 'package:flutter/material.dart';

Widget bgTopImage({Widget? child}) {
  return Container(
    decoration: const BoxDecoration(
      // image: DecorationImage(
      //   image: AssetImage(topBgImagePath),
      //   fit: BoxFit.fill,
      // ),
      color: whiteColor,
    ),
    child: child,
  );
}
