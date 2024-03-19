import 'package:ecommerce/utils/colors.dart';
import 'package:ecommerce/utils/const.dart';
import 'package:flutter/material.dart';

Widget inputField({String? title, String? hintText}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      if (title != null)
        Text(
          title,
          style:
              TextStyle(fontSize: inputLabelFontSize, color: inputLabelColor),
        ),
      TextField(
        decoration: InputDecoration(
          hintStyle:
              TextStyle(color: inputHintColor, fontSize: inputHintFontSize),
          hintText: hintText,
          isDense: true,
          contentPadding: EdgeInsets.all(8), // Adjust padding here
          fillColor: inputFillColorGrey,
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide.none,
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: inputFocusBorderColor),
          ),
        ),
      ),
    ],
  );
}
