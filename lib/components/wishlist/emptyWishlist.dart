import 'package:ecommerce/utils/colors.dart';
import 'package:flutter/cupertino.dart';

Widget emptyWishlist() {
  return Container(
    color: whiteColor,
    child: Center(
      child: Image.asset("assets/images/system/empty_wishlist.png"),
    ),
  );
}
