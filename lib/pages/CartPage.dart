import 'package:ecommerce/language/Language.dart';
import 'package:ecommerce/utils/colors.dart';
import 'package:ecommerce/utils/icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class CartPage extends StatefulWidget {
  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  // hive
  final cartBox = Hive.box("cartBox");

  // variable
  late List cartProducts; // Changed to late

  // init state
  @override
  void initState() {
    super.initState();
    // cart product get
    var cartProduct = cartBox.get("cartProducts");
    if (cartProduct != null) {
      cartProducts = List.from(cartProduct);
    } else {
      cartProducts = []; // Ensure it's initialized even if cartProduct is null
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          Language.load("cart_product"),
          style: const TextStyle(color: whiteColor),
        ),
      ),
      body: ListView.builder(
        itemCount: cartProducts.length,
        itemBuilder: (context, index) {
          final product = cartProducts[index];
          return Column(
            children: [
              ListTile(
                title: Text(
                  product['title'].length > 20
                      ? '${product['title'].substring(0, 20)}...'
                      : product['title'],
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                subtitle: Text('Price: \$${product['price']}'),
                leading: const CircleAvatar(),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    incrementDecrementCartItem(Icons.add, 'increment'),
                    Container(
                      width: 30,
                      height: 22,
                      color: const Color.fromARGB(55, 64, 91, 247),
                      child: const Center(
                        child: Text(
                          '${1}',
                          style: TextStyle(fontSize: 15),
                        ),
                      ),
                    ),
                    incrementDecrementCartItem(Icons.remove, 'decrement'),
                    IconButton(
                      style: ButtonStyle(
                        // backgroundColor: MaterialStateProperty.all(
                        //   Color.fromARGB(19, 247, 64, 64),
                        // ),
                        overlayColor: MaterialStateProperty.all(
                          Color.fromARGB(19, 247, 64, 64),
                        ),
                        iconSize: MaterialStateProperty.all(20),
                        padding: MaterialStateProperty.all(
                          EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                        ),
                      ),
                      icon: Icon(
                        onlyDeleteIcon,
                        color: redColor,
                      ),
                      onPressed: () {
                        // Add your logic here
                      },
                    ),
                  ],
                ),
              ),
              const Divider(),
            ],
          );
        },
      ),
    );
  }
}

Widget incrementDecrementCartItem(btnIcon, btnType) {
  return SizedBox(
    width: 25,
    height: 25,
    child: IconButton(
      style: ButtonStyle(
        padding: MaterialStateProperty.all(const EdgeInsets.all(2)),
        backgroundColor: MaterialStateProperty.all(blueColor),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: btnType == 'increment'
                  ? const Radius.circular(5)
                  : Radius.zero,
              topLeft: btnType == 'increment'
                  ? const Radius.circular(5)
                  : Radius.zero,
              topRight: btnType == 'decrement'
                  ? const Radius.circular(5)
                  : Radius.zero,
              bottomRight: btnType == 'decrement'
                  ? const Radius.circular(5)
                  : Radius.zero,
            ),
          ),
        ),
      ),
      icon: Icon(
        btnIcon,
        color: whiteColor,
        size: 18,
      ),
      onPressed: () {
        // Add logic to increment quantity
      },
    ),
  );
}
