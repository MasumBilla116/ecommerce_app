import 'package:ecommerce/utils/colors.dart';
import 'package:ecommerce/utils/icons.dart';
import 'package:ecommerce/utils/navigationMenu.dart';
import 'package:flutter/material.dart';

Widget addToCartAppBarBtn(context, cartItem) {
  return Stack(
    children: [
      SizedBox(
        height: 50,
        width: 50,
        child: GestureDetector(
          onTap: () {
            goToAddToCartProductPage(context);
          },
          child: const Icon(
            onlyShoppingCartIcon,
            color: whiteColor,
          ),
        ),
      ),
      Positioned(
        right: 5,
        bottom: 25,
        child: GestureDetector(
          onTap: () {
            goToAddToCartProductPage(context);
          },
          child: Container(
            width: 18,
            height: 18,
            decoration: BoxDecoration(
              color: orangeColor,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: Text(
                "${cartItem}",
                style: const TextStyle(color: whiteColor),
              ),
            ),
          ),
        ),
      ),
    ],
  );
}
