import 'package:ecommerce/utils/colors.dart';
import 'package:ecommerce/utils/const.dart';
import 'package:ecommerce/utils/font.dart';
import 'package:flutter/material.dart';

Widget productComponent(Map<String, dynamic> product) {
  return Container(
    margin: const EdgeInsets.only(right: 15, left: 15),
    width: 250,
    padding: const EdgeInsets.all(12),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.all(Radius.circular(12)),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (product["image"] != null) Image.asset(product["image"]),
        if (product["description"] != null)
          Text(
            product["description"],
            style: TextStyle(
              color: Colors.black, // Assuming textColor is defined elsewhere
            ),
            textAlign: TextAlign.justify,
          ),
        spaceTopBottom,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            if (product['discount'] != null)
              Text(
                "${product['discount']}% OFF",
                style: const TextStyle(fontSize: 18, color: bgRedColor),
              ),
            if (product['discount'] != null)
              Text(
                "${product['price']} Tk",
                style: const TextStyle(
                  fontSize: 16,
                  color: textColor,
                  decoration: TextDecoration.lineThrough,
                ),
              ),
            if (product["price"] != null)
              Text(
                "${product["price"]} Tk.",
                style: sectionTitleTextStyle,
              ),
          ],
        ),
      ],
    ),
  );
}
