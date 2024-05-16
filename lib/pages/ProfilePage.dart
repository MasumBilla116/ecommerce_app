import 'package:ecommerce/components/appbar/zeroAppBar.dart';
import 'package:ecommerce/components/background/BgTopImage.dart';
import 'package:ecommerce/components/buttons/addToCardButton.dart';
import 'package:ecommerce/components/cart/emptyCart.dart';
import 'package:ecommerce/components/wishlist/emptyWishlist.dart';
import 'package:ecommerce/language/Language.dart';
import 'package:ecommerce/method/addToWishlist.dart';
import 'package:ecommerce/method/addTocart.dart';
import 'package:ecommerce/pages/CartPage.dart';
import 'package:ecommerce/utils/colors.dart';
import 'package:ecommerce/utils/demoData.dart';
import 'package:ecommerce/utils/icons.dart';
import 'package:ecommerce/utils/navigationMenu.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({Key? key}) : super(key: key);
  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
// hive
  final cartBox = Hive.box("cartBox");
  final wishlistBox = Hive.box("wishlistBox");

  // product
  dynamic cart = {
    "total_items": 0,
    "total_price": 0,
    "products": [],
  };
  dynamic wishlistItem = [];
  final profileButtonTextList = ["my_order", "my_wishlist", 'message'];

  // tab items
  var showTapItems = 0;

  // init state
  void initState() {
    super.initState();
    loadCartProduct();
    loadWishlistProduct();
  }

  // void load wishlist
  void loadWishlistProduct() {
    var wishlistProduct = wishlistBox.get("wishlistProducts");
    setState(() {
      if (wishlistProduct != null) {
        wishlistItem = wishlistProduct;
      } else {
        wishlistItem = [];
      }
    });
  }

  // load card
  void loadCartProduct() {
    var cartProduct = cartBox.get("cartProducts");
    if (cartProduct != null) {
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

  // handler
  void handleTapItems(index) {
    setState(() {
      showTapItems = index;
    });
  }

  void _deleteCartProduct(product) {
    // print(product);
    setState(() {
      deleteCartProduct(product);
      loadCartProduct();
    });
  }

  void _addToCart(product) {
    addToCart(product);
    wishlist(product);
    setState(() {
      loadCartProduct();
      loadWishlistProduct();
    });
  }

  void _goToOrderPage() {
    goToOrderPage(context);
  }

  @override
  Widget build(BuildContext context) {
    return bgTopImage(
      child: Scaffold(
        appBar: zeroAppbar(),
        bottomSheet: showTapItems == 1
            ? Row(
                children: [
                  bottomSheetBtn(_goToOrderPage, onlyShoppingCartIcon,
                      Language.load("order_now"), baseColor),
                ],
              )
            : null,
        body: SafeArea(
          child: Column(
            children: [
              // user profile
              Container(
                padding: const EdgeInsets.all(12),
                color: baseColor,
                child: Row(
                  children: [
                    const CircleAvatar(
                      radius: 40,
                      backgroundImage:
                          AssetImage("assets/images/profile/profile.jpg"),
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Zoe Alexa",
                            style: TextStyle(
                                fontSize: 18,
                                color: whiteColor,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "zoealexa@gmail.com",
                            style: TextStyle(fontSize: 12, color: whiteColor),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        // profile edit
                        IconButton(
                          onPressed: () {
                            goToProfileEditPage(context);
                          },
                          icon: const Icon(
                            Icons.edit_square,
                            color: whiteColor,
                          ),
                          style: const ButtonStyle(
                              backgroundColor:
                                  MaterialStatePropertyAll(baseDarkColor)),
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          style: const ButtonStyle(
                            elevation: MaterialStatePropertyAll(5),
                            backgroundColor:
                                MaterialStatePropertyAll(orangeColor),
                          ),
                          child: const Text(
                            "Logout",
                            style: TextStyle(
                              color: whiteColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              // order info
              Container(
                color: baseColor,
                width: MediaQuery.of(context).size.width,
                height: 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      child: _boxWidget(
                          context,
                          Language.load("in_your_wishlist"),
                          wishlistItem.length,
                          0,
                          showTapItems),
                      onTap: () {
                        handleTapItems(0);
                      },
                    ),
                    GestureDetector(
                      child: _boxWidget(context, Language.load("in_your_cart"),
                          cart['total_items'], 1, showTapItems),
                      onTap: () {
                        handleTapItems(1);
                      },
                    ),
                    GestureDetector(
                      child: _boxWidget(context,
                          Language.load("in_you_ordered"), 0, 2, showTapItems),
                      onTap: () {
                        handleTapItems(2);
                      },
                    ),
                  ],
                ),
              ),
              // show item list history
              if (showTapItems == 0)
                wishlistItemList(wishlistItem, _addToCart)
              else if (showTapItems == 1)
                cartProductList(cart, _deleteCartProduct)
              else
                const Expanded(
                  child: Center(
                    child: Text(
                      "No Data Found",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                  ),
                ),
              // end
            ],
          ),
        ),
      ),
    );
  }
}

Widget cartProductList(cart, _deleteCartProduct) {
  return Expanded(
    child: cart['products'].isNotEmpty
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
                            _deleteCartProduct(product);
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

Widget wishlistItemList(products, _addToCart) {
  return Expanded(
    child: products.isNotEmpty
        ? ListView.builder(
            itemCount: products.length,
            itemBuilder: (context, index) {
              final product = products[index];
              return ListTile(
                leading: Image.asset(product['image'], width: 50, height: 50),
                title: Text(
                  product['title'].length > 20
                      ? '${product['title'].substring(0, 20)}...'
                      : product['title'],
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                subtitle: Text("\$${product['price']}"),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      onPressed: () {
                        // add to cart product
                        _addToCart(product);
                      },
                      highlightColor: orangeColor,
                      style: const ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(
                            Color.fromARGB(155, 149, 250, 146)),
                      ),
                      icon: const Icon(
                        onlyShoppingCartIcon,
                        color: baseColor,
                        size: 20,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      highlightColor: orangeColor,
                      style: const ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(
                            Color.fromARGB(155, 250, 205, 146)),
                      ),
                      icon: const Icon(
                        onlyDeleteIcon,
                        color: redColor,
                        size: 20,
                      ),
                    ),
                  ],
                ),
              );
            },
          )
        : emptyWishlist(),
  );
}

Widget _boxWidget(
    BuildContext context, String labelKey, total, itemIndex, active) {
  return Container(
    height: 65,
    width: MediaQuery.of(context).size.width / 3.4,
    padding: const EdgeInsets.only(
      left: 8,
      right: 8,
      top: 5,
    ),
    decoration: BoxDecoration(
      color: whiteColor,
      borderRadius: const BorderRadius.all(
        Radius.circular(5),
      ),
      border: Border(
        bottom: BorderSide(
          color: itemIndex == active ? orangeColor : transparentColor,
          width: 5,
        ),
      ),
      boxShadow: const [
        BoxShadow(
          color: Color.fromARGB(92, 0, 0, 0),
          offset: Offset(0, 1.5),
          blurRadius: 5,
          spreadRadius: .3,
        ),
      ],
    ),
    child: Column(
      children: [
        Text(
          "$total",
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        Text(labelKey),
      ],
    ),
  );
}
