import 'package:ecommerce/utils/app.dart';
import 'package:ecommerce/utils/font.dart';
import 'package:ecommerce/utils/navigationMenu.dart';
import 'package:flutter/material.dart';

Widget productComponent(context, Map<String, dynamic> product,
    {descriptionShow = false}) {
  double discountPrice = 0;
  double lessPrice = 0.0;

  if (product['discount'] != null) {
    lessPrice = (product['discount'] * product['price']) / 100;
    discountPrice = product['price'] - lessPrice;
  }

  return GestureDetector(
      onTap: () {
        goToProductDetailPage(context, product['id'], product['title']);
      },
      child: Container(
        margin: const EdgeInsets.only(right: 15, left: 15),
        width: 250,
        padding: const EdgeInsets.all(12),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (product["image"] != null) Image.asset(product["image"]),
            if (product["description"] != null && descriptionShow == true)
              Text(
                product["description"].length > 210
                    ? product['description'].substring(0, 210) + "......"
                    : product['description'],
                style: productDescriptionTextStyle,
                textAlign: TextAlign.justify,
              ),
            if (product["title"] != null)
              Text(
                product["title"],
                style: productTitleTextStyle,
              ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                if (product['discount'] != null)
                  Text(
                    "${product['discount']}% OFF",
                    style: productDiscountTextStyle,
                  ),
                const Spacer(),
                if (product['discount'] != null)
                  Text(
                    "${product['price']}$currency",
                    style: productDiscountPriceStyle,
                  ),
                const Spacer(),
                if (product["price"] != null)
                  Text(
                    "$discountPrice $currency.",
                    style: sectionTitleTextStyle,
                  ),
              ],
            ),
          ],
        ),
      ));
}
