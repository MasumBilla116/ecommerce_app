import 'package:ecommerce/components/badge/roundedBadge.dart';
import 'package:ecommerce/components/cart/emptyCart.dart';
import 'package:ecommerce/language/Language.dart';
import 'package:ecommerce/method/addTocart.dart';
import 'package:ecommerce/utils/colors.dart';
import 'package:ecommerce/utils/icons.dart';
import 'package:ecommerce/utils/navigationMenu.dart';
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
    } else {
      cart = {
        "total_items": 0,
        "total_price": 0,
        "products": [],
      };
    }
  }

  // clear cart alert box
  void clearCartItem() {
    showDialog(context: context, builder: (context) => _clearCart(context));
  }

  Widget _clearCart(BuildContext context) {
    return AlertDialog(
      content: Text(
        Language.load("are_you_sure_clear_cart_item"),
        style: const TextStyle(fontSize: 18),
      ),
      actions: [
        TextButton(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(greenColor)),
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text(
            Language.load("cancel"),
            style: const TextStyle(color: whiteColor),
          ),
        ),
        TextButton(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(lightRedColor)),
          onPressed: () {
            setState(() {
              clearCartProduct();
              loadCartProduct();
              Navigator.pop(context);
            });
          },
          child: Text(
            Language.load("delete"),
            style: const TextStyle(color: whiteColor),
          ),
        ),
      ],
    );
  }

// naviagate to order page
  void routeOrderPage() {
    goToOrderPage(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: cart['products'].isNotEmpty
          ? Row(
              children: [
                bottomSheetBtn(clearCartItem, onlyDeleteIcon,
                    Language.load("clear_cart_items"), orangeColor),
                bottomSheetBtn(routeOrderPage, onlyShoppingCartIcon,
                    Language.load("order_now"), baseColor),
              ],
            )
          : null,
      appBar: AppBar(
        automaticallyImplyLeading: false,
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
                                  horizontal: 5,
                                  vertical: 5,
                                ),
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
          : emptyCart(),
    );
  }
}

Widget bottomSheetBtn(handleMethod, btnIcon, btnText, bgColor) {
  return Expanded(
    child: ElevatedButton.icon(
      style: ButtonStyle(
        backgroundColor: MaterialStatePropertyAll(bgColor),
        elevation: const MaterialStatePropertyAll(0),
        shape: MaterialStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0),
          ),
        ),
      ),
      onPressed: () {
        handleMethod();
      },
      label: Text(
        style: const TextStyle(color: whiteColor),
        btnText,
      ),
      icon: Icon(
        btnIcon,
        color: whiteColor,
      ),
    ),
  );
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
