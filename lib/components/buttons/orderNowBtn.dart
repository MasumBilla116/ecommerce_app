import "package:ecommerce/language/Language.dart";
import "package:ecommerce/utils/colors.dart";
import "package:ecommerce/utils/icons.dart";
import "package:flutter/material.dart";

class OrderNowButton extends StatefulWidget {
  const OrderNowButton({Key? key}) : super(key: key);
  @override
  State<OrderNowButton> createState() => _OrderNowButtonState();
}

class _OrderNowButtonState extends State<OrderNowButton> {
  int selectedCardOption = 1;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(baseColor),
        padding: MaterialStateProperty.all(
          const EdgeInsets.only(left: 5, right: 5),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Icon(
            onlyGiftBoxIcon,
            color: orangeColor,
          ),
          const SizedBox(
            width: 5,
          ),
          Text(
            Language.load("order_now"),
            style: const TextStyle(
              color: whiteColor,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
