import 'package:ecommerce/utils/colors.dart';
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
        title: const Text(
          'Cart Product',
          style: TextStyle(color: whiteColor),
        ),
      ),
      body: Container(
        child: ListView.builder(
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
                      incrementDecrementCartItem(Icons.add),
                      const SizedBox(
                        width: 30,
                        child: Center(
                          child: Text(
                            '${1}',
                            style: TextStyle(fontSize: 15),
                          ),
                        ),
                      ),
                      incrementDecrementCartItem(Icons.remove),
                      IconButton(
                        icon: const Icon(
                          Icons.delete,
                          color: redColor,
                        ),
                        onPressed: () {
                          // Add logic to delete item from cart
                        },
                      ),
                    ],
                  ),
                ),
                Divider(), // Add a Divider widget between each ListTile
              ],
            );
          },
        ),
      ),
    );
  }
}

Widget incrementDecrementCartItem(btnIcon) {
  return SizedBox(
    width: 25, // Adjust width here
    height: 25, // Adjust height here
    child: IconButton(
      style: ButtonStyle(
        padding: MaterialStateProperty.all(
            const EdgeInsets.all(2)), // Adjust padding here
        backgroundColor: MaterialStateProperty.all(blueColor),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
                5.0), // Change the value to your desired border radius
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
