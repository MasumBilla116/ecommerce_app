import 'package:ecommerce/utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// section font style
TextStyle sectionTitleTextStyle = const TextStyle(
  fontSize: 20,
  fontWeight: FontWeight.bold,
  color: darkColor,
);

// product title
TextStyle productTitleTextStyle = const TextStyle(
  fontSize: 14,
  fontWeight: FontWeight.bold,
  color: darkColor,
);

// discount price style
TextStyle productDiscountPriceStyle = const TextStyle(
  fontSize: 13,
  color: textColor,
  decoration: TextDecoration.lineThrough,
);

TextStyle productDiscountTextStyle =
    const TextStyle(fontSize: 13, color: bgRedColor);

TextStyle productDescriptionTextStyle = const TextStyle(
  color: Colors.black, // Assuming textColor is defined elsewhere
);
