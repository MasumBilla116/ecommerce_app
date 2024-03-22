import 'package:ecommerce/utils/colors.dart';
import 'package:ecommerce/utils/const.dart';
import 'package:flutter/material.dart';

Widget customButton({String? title, Color? btnBgColor}) {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      backgroundColor: btnBgColor,
      padding: const EdgeInsets.all(5),
      fixedSize: const Size(500, double.infinity),
    ),
    onPressed: () {},
    child: Text(
      title != null
          ? title!
          : '', // Render title if not null, otherwise render an empty string
      style: TextStyle(fontSize: buttonFontSize ?? 20, color: buttonTextColor),
    ),
  );
}
