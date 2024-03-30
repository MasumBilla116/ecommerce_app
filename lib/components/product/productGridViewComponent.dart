import 'package:ecommerce/utils/app.dart';
import 'package:ecommerce/utils/font.dart';
import 'package:ecommerce/utils/navigationMenu.dart';
import 'package:flutter/material.dart';

Widget productGridViewComponent(
    BuildContext context, Map<String, dynamic> product) {
  double discountPrice = 0;
  double lessPrice = 0.0;

  if (product['discount'] != null) {
    lessPrice =
        (double.parse(product['discount']) * double.parse(product['price'])) /
            100;
    discountPrice = double.parse(product['price']) - lessPrice;
  }

  return ElevatedButton(
    onPressed: () {
      goToProductDetailPage(context, 1, product['title']);
    },
    style: ElevatedButton.styleFrom(
      padding: EdgeInsets.zero,
      shape: BeveledRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      elevation: 2,
    ),
    child: Container(
      padding: const EdgeInsets.all(12),
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
                  style: const TextStyle(color: Colors.red, fontSize: 10),
                )
            ],
          ),
        ],
      ),
    ),
  );
}
