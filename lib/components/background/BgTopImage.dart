import 'package:ecommerce/utils/images.dart';
import 'package:flutter/material.dart';

Widget bgTopImage({Widget? child}) {
  return Container(
    decoration: const BoxDecoration(
      // image: DecorationImage(
      //   image: AssetImage(topBgImagePath),
      //   fit: BoxFit.fill,
      // ),
      color: Color.fromARGB(255, 236, 236, 236),
    ),
    child: child,
  );
}
