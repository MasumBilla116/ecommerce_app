import 'package:ecommerce/components/badge/roundedBadge.dart';
import 'package:ecommerce/language/Language.dart';
import 'package:ecommerce/method/addTocart.dart';
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
  dynamic cart = {
    "total_items": 0,
    "total_price": 0,
    "products": [],
  };
  // init state
  @override
  void initState() {
    super.initState();
    // cart product get
    var cartProduct = cartBox.get("cartProducts");

    if (cartProduct != null) {
      cartProducts = cartProduct['products'];
      setState(() {
        cart['total_items'] = cartProduct['total_items'];
        cart['total_price'] = cartProduct['total_price'];
        cart['products'] = cartProduct['products'];
      });
    } else {
      setState(() {
        cart['total_items'] = 0;
        cart['total_price'] = 0;
        cart['products'] = [];
      });
      cartProducts = [];
    }
  }

  // load card
  void loadCartProduct() {
    var cartProduct = cartBox.get("cartProducts");
    if (cartProduct != null) {
      cartProducts = cartProduct['products'];
      setState(() {
        cart['total_items'] = cartProduct['total_items'];
        cart['total_price'] = cartProduct['total_price'];
        cart['products'] = cartProduct['products'];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          if (cart['products'].isNotEmpty)
            TextButton.icon(
              onPressed: () {},
              style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(orangeColor),
                elevation: MaterialStatePropertyAll(10),
                shadowColor: MaterialStatePropertyAll(blueColor),
              ),
              icon: const Icon(
                CupertinoIcons.hand_point_right,
                color: whiteColor,
              ),
              label: Text(
                Language.load("buy_now"),
                style: const TextStyle(color: whiteColor, fontSize: 15),
              ),
            ),
          const SizedBox(
            width: 15,
          ),
        ],
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              Language.load("cart_product"),
              style: const TextStyle(color: whiteColor),
            ),
            Row(
              children: [
                roundedBadge(Language.load('items'), cart['total_items']),
                const SizedBox(width: 8),
                roundedBadge(Language.load('price'), cart['total_price']),
              ],
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
      body: cart['products'].isNotEmpty
          ? ListView.builder(
              itemCount: cart['products'].length,
              itemBuilder: (context, index) {
                final product = cart['products'][index];
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
                      leading: Image.asset(product['image']),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          incrementDecrementCartItem(product['id'], Icons.add,
                              'increment', loadCartProduct),
                          Container(
                            width: 30,
                            height: 22,
                            color: const Color.fromARGB(55, 64, 91, 247),
                            child: Center(
                              child: Text(
                                "${product["quantity"]}",
                                style: const TextStyle(fontSize: 15),
                              ),
                            ),
                          ),
                          incrementDecrementCartItem(product['id'],
                              Icons.remove, 'decrement', loadCartProduct),
                          IconButton(
                            style: ButtonStyle(
                              overlayColor: MaterialStateProperty.all(
                                const Color.fromARGB(19, 247, 64, 64),
                              ),
                              iconSize: MaterialStateProperty.all(20),
                              padding: MaterialStateProperty.all(
                                const EdgeInsets.symmetric(
                                    horizontal: 5, vertical: 5),
                              ),
                            ),
                            icon: const Icon(
                              onlyDeleteIcon,
                              color: redColor,
                            ),
                            onPressed: () {
                              setState(() {
                                deleteCartProduct(product);
                                loadCartProduct();
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                    const Divider(),
                  ],
                );
              },
            )
          : Container(
              color: whiteColor,
              child: Center(
                child: Image.asset("assets/images/system/empty_cart.png"),
              ),
            ),
    );
  }
}

Widget incrementDecrementCartItem(
    productId, btnIcon, btnType, loadCartProduct) {
  return SizedBox(
    width: 25,
    height: 25,
    child: IconButton(
      highlightColor: orangeColor,
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
        if (btnType == 'increment') {
          incrementOrDecrementCartItems(productId, "increment");
        } else {
          incrementOrDecrementCartItems(productId, "decrement");
        }
        loadCartProduct();
      },
    ),
  );
}
