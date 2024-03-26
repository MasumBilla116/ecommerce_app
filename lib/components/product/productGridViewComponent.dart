import 'package:ecommerce/utils/app.dart';
import 'package:ecommerce/utils/font.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget productGridViewComponent(Map<String, dynamic> product) {
  double discountPrice = 0;
  double lessPrice = 0.0;

  if (product['discount'] != null) {
    lessPrice =
        (double.parse(product['discount']) * double.parse(product['price'])) /
            100;
    discountPrice = double.parse(product['price']) - lessPrice;
  }

  return Container(
    padding: EdgeInsets.all(12),
    decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(10)),
        boxShadow: [
          BoxShadow(
            color: Color.fromARGB(25, 0, 0, 0),
            spreadRadius: 2,
            blurRadius: 10,
            offset: Offset(0, 3),
          ),
        ]),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (product["image"] != null) Image.asset(product["image"]),
        if (product["title"] != null)
          Text(
            product["title"].length > 19
                ? product['title'].substring(0, 17) + '...'
                : product['title'],
          ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            if (product["price"] != null)
              Text(
                "$discountPrice $currency.",
                style: const TextStyle(
                  fontSize: 15,
                ),
              ),
            const Spacer(),
            if (product['discount'] != null)
              Text(
                product['discount'] + "% Off",
                style: TextStyle(color: Colors.red, fontSize: 10),
              )
          ],
        ),
      ],
    ),
  );
}
