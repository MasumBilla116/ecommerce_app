import 'package:ecommerce/utils/colors.dart';
import 'package:flutter/cupertino.dart';

Widget roundedBadge(title, titleValue) {
  return Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      Container(
        padding: const EdgeInsets.only(left: 10, right: 10, top: 3, bottom: 3),
        decoration: BoxDecoration(
          color: baseDarkColor,
          borderRadius: BorderRadius.circular(50),
        ),
        child: Center(
          child: Text(
            "$title: $titleValue",
            style: const TextStyle(fontSize: 13, color: whiteColor),
          ),
        ),
      ),
    ],
  );
}
