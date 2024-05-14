import 'package:ecommerce/utils/colors.dart';
import 'package:flutter/cupertino.dart';

Widget emptyCart() {
  return Container(
    color: whiteColor,
    child: Center(
      child: Image.asset("assets/images/system/empty_cart.png"),
    ),
  );
}
