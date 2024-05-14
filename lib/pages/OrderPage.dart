import 'package:ecommerce/components/cart/emptyCart.dart';
import 'package:ecommerce/language/Language.dart';
import 'package:ecommerce/utils/app.dart';
import 'package:ecommerce/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class OrderPage extends StatefulWidget {
  State<OrderPage> createState() => _orderPageState();
}

class _orderPageState extends State<OrderPage> {
  final cartBox = Hive.box("cartBox");
  dynamic cart = {
    "total_items": 0,
    "total_price": 0,
    'shipping_charge': 0,
    "additional_charge": 0,
    "payable_amount": 0,
    "products": []
  };

  @override
  void initState() {
    super.initState();
    loadCart();
  }

  void loadCart() {
    final cartProducts = cartBox.get("cartProducts");
    if (cartProducts != null) {
      setState(() {
        cart['total_items'] = cartProducts['total_items'];
        cart['total_price'] = cartProducts['total_price'];
        cart['products'] = cartProducts['products'];
        cart['shipping_charge'] = 0;
        cart['additional_charge'] = 0;
        cart['payable_amount'] = cart['total_price'];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWithLeading(Language.load("order_now"), context),
      body: cart['products'].isNotEmpty
          ? Column(
              children: [
                Container(
                    color: baseDarkColor,
                    height: 50,
                    child: Row(
                      children: [
                        tableRowHeader(Language.load("product")),
                        tableRowHeader(Language.load("quantity")),
                        tableRowHeader(Language.load("price")),
                      ],
                    )),
                const SizedBox(
                  height: 5,
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: cart['products'].length,
                    itemBuilder: (context, index) {
                      final product = cart['products'][index];
                      // list of product row
                      return listRow(product);
                    },
                  ),
                ),
                Container(
                  decoration: const BoxDecoration(
                    color: whiteColor,
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromARGB(48, 0, 0, 0),
                        blurRadius: 5,
                        spreadRadius: 1,
                        offset: Offset(5, 0),
                      ),
                    ],
                  ),
                  padding: const EdgeInsets.only(top: 15),
                  child: Column(
                    children: [
                      payableAmountCalculation(Language.load("shipping_charge"),
                          cart['shipping_charge']),
                      payableAmountCalculation(
                          Language.load("additional_charge"),
                          cart['additional_charge']),
                      payableAmountCalculation(
                          Language.load("product_price"), cart['total_price']),
                      const Divider(),
                      payableAmountCalculation(Language.load("payable_amount"),
                          cart['payable_amount']),
                      const SizedBox(
                        height: 10,
                      ),
                      // confirm orderbutton
                      Row(
                        children: [
                          Expanded(
                            child: ElevatedButton.icon(
                              style: ButtonStyle(
                                backgroundColor:
                                    const MaterialStatePropertyAll(orangeColor),
                                shape: MaterialStatePropertyAll(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(0),
                                  ),
                                ),
                              ),
                              onPressed: () {},
                              label: Text(
                                Language.load("confirm_order"),
                                style: const TextStyle(
                                  color: whiteColor,
                                  fontSize: 18,
                                ),
                              ),
                              icon: const Icon(
                                Icons.arrow_forward_ios,
                                color: whiteColor,
                              ),
                              iconAlignment: IconAlignment.end,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            )
          : emptyCart(),
    );
  }
}

// payable amount calculation
Widget payableAmountCalculation(title, amount) {
  return Column(
    children: [
      Row(
        children: [
          payableTextRow(title, TextAlign.end),
          const SizedBox(
            width: 20,
            child: Center(
              child: Text(":"),
            ),
          ),
          payableTextRow(amount, TextAlign.start),
        ],
      )
    ],
  );
}

Widget payableTextRow(text, textAlign) {
  return Expanded(
    child: Text(
      "$text",
      textAlign: textAlign,
    ),
  );
}

Widget listRow(product) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Row(
        children: [
          Expanded(
              child: Center(
                  child: SizedBox(
            width: 50,
            child: Image.asset(product['image']),
          ))),
          Expanded(child: Center(child: Text("${product['quantity']}"))),
          Expanded(child: Center(child: Text("${product['price']}"))),
        ],
      ),
      Container(
        color: const Color.fromARGB(190, 223, 223, 223),
        height: 1,
      )
    ],
  );
}

Widget tableRowHeader(title) {
  return Expanded(
    child: Center(
      child: Text(
        title,
        style: const TextStyle(
            color: whiteColor, fontSize: 15, fontWeight: FontWeight.bold),
      ),
    ),
  );
}
