import 'package:ecommerce/utils/colors.dart';
import 'package:flutter/material.dart';

Widget bottomSheetBtn(handleMethod, btnIcon, btnText, bgColor) {
  return Expanded(
    child: ElevatedButton.icon(
      style: ButtonStyle(
        backgroundColor: MaterialStatePropertyAll(bgColor),
        elevation: const MaterialStatePropertyAll(0),
        shape: MaterialStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0),
          ),
        ),
      ),
      onPressed: () {
        handleMethod();
      },
      label: Text(
        style: const TextStyle(color: whiteColor),
        btnText,
      ),
      icon: Icon(
        btnIcon,
        color: whiteColor,
      ),
    ),
  );
}
