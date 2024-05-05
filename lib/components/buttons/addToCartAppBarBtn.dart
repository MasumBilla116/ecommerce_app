import 'package:ecommerce/utils/colors.dart';
import 'package:ecommerce/utils/icons.dart';
import 'package:ecommerce/utils/navigationMenu.dart';
import 'package:flutter/material.dart';

Widget addToCartAppBarBtn(context, cartItem) {
  return Stack(
    children: [
      IconButton(
        onPressed: () {
          goToAddToCartProductPage(context);
        },
        icon: shoppingCartIcon,
        color: whiteColor,
      ),
      Positioned(
        right: 5,
        bottom: 25,
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
    ],
  );
}