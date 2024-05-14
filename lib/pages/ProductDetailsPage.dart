import 'package:ecommerce/components/background/BgTopImage.dart';
import 'package:ecommerce/components/buttons/addToCardButton.dart';
import 'package:ecommerce/components/buttons/addToCartAppBarBtn.dart';
import 'package:ecommerce/components/buttons/orderNowBtn.dart';
import 'package:ecommerce/components/carousel/carouselIndicatorComponent.dart';
import 'package:ecommerce/components/circle/colorsCircle.dart';
import 'package:ecommerce/components/circle/textCircle.dart';
import 'package:ecommerce/components/iconGrid/likeDislikeCommentIconGrid.dart';
import 'package:ecommerce/components/tab/tabComponent.dart';
import 'package:ecommerce/language/Language.dart';
import 'package:ecommerce/utils/colors.dart';
import 'package:ecommerce/utils/const.dart';
import 'package:ecommerce/utils/demoData.dart';
import 'package:ecommerce/utils/font.dart';
import 'package:ecommerce/utils/icons.dart';
import 'package:ecommerce/utils/navigationMenu.dart';
import 'package:ecommerce/utils/string.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ProductDetailsPage extends StatefulWidget {
  int productId;
  String productTitle;
  ProductDetailsPage(
      {required this.productId, required this.productTitle, Key? key})
      : super(key: key);
  State<ProductDetailsPage> createState() => _ProductDetailsPage();
}

class _ProductDetailsPage extends State<ProductDetailsPage> {
  // hive
  final cartBox = Hive.box("cartBox");

// variables
  var bookMark = false;
  var isShare = false;
  dynamic cart = {
    "total_items": 0,
    "total_price": 0,
    "products": [],
  };

  // init state
  @override
  void initState() {
    final cartItems = cartBox.get("cartProducts");
    super.initState();
    // update carts items
    setState(() {
      if (cartItems != null) {
        cart['total_items'] = cartItems['total_items'];
        cart['products'] = cartItems['products'];
      }
    });
  }

  var tabButtons = [
    {
      "title": "1 PIECES PRICE",
    },
    {
      "title": "1 BUNDLE PRICE",
    }
  ];

  // handler
  void updateCartItems() {
    final cartItems = cartBox.get("cartProducts");
    setState(() {
      if (cartItems != null) {
        cart['total_items'] = cartItems['total_items'];
        cart['products'] = cartItems['products'];
      }
    });
  }

  void bookMarkProduct() {
    setState(() {
      bookMark = !bookMark;
    });
  }

  void shareProduct() {
    setState(() {
      isShare = !isShare;
    });
  }

  // find product for add to cart product
  Map<String, dynamic>? findProductById(int proId) {
    var pro = demoProductList.firstWhere((item) => item['id'] == proId);
    if (pro.isEmpty) {
      return null;
    }
    return pro;
  }

  bool isExistInCart(productId) {
    var find = cart['products'].where((product) => product['id'] == productId);
    if (find.length == 0) {
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return bgTopImage(
      child: Scaffold(
        // app bar
        appBar: AppBar(
          actions: [
            // add to cart app bar btn
            addToCartAppBarBtn(context, cart['total_items']),
            IconButton(
              onPressed: () {
                shareProduct();
              },
              icon: shareIcon,
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                    const Color.fromARGB(255, 1, 110, 83)),
                iconColor: MaterialStateProperty.all(
                    isShare ? orangeColor : whiteColor),
              ),
            ),
            IconButton(
              onPressed: () {
                bookMarkProduct();
              },
              icon: bookMark ? loveFillIcon : loveIcon,
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                    const Color.fromARGB(255, 1, 110, 83)),
                iconColor: MaterialStateProperty.all(orangeColor),
              ),
            ),
            const SizedBox(
              width: 10,
            )
          ],
          leading: IconButton(
            onPressed: () {
              back(context);
            },
            icon: arrowTurnUpLeftIcon,
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(
                  const Color.fromARGB(255, 1, 110, 83)),
              iconColor: MaterialStateProperty.all(whiteColor),
            ),
          ),
        ),
        // scaffold body
        body: Padding(
          padding: const EdgeInsets.all(9),
          child: SingleChildScrollView(
            child: Container(
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      CarouselIndicatorComponent(topSlideDemoItems),
                      Container(
                        padding: const EdgeInsets.only(left: 12, right: 12),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            likeDislikeCommentGrid(onlyThumbupIcon, 10000),
                            likeDislikeCommentGrid(onlyThumbdownIcon, 256000),
                            likeDislikeCommentGrid(onlyReviewIcon, 326540),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    color: const Color.fromARGB(64, 158, 158, 158),
                    padding: const EdgeInsets.all(10),
                    width: MediaQuery.of(context).size.width,
                    child: Text(
                      widget.productTitle,
                      style: sectionTitleTextStyle,
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.all(10),
                    color: const Color.fromARGB(25, 158, 158, 158),
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "1 PIECES 180/- TK",
                          style: TextStyle(
                              color: darkColor, fontWeight: FontWeight.w500),
                        ),
                        Text(
                          "1 BOUNDLE 1200/- TK",
                          style: TextStyle(
                              color: darkColor, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.all(10),
                    color: const Color.fromARGB(25, 158, 158, 158),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              child: Image.asset('assets/images/brands/s1.jpg'),
                            ),
                            const SizedBox(
                              width: 12,
                            ),
                            const Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Masum Gurments",
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold),
                                ),
                                Row(
                                  children: [
                                    Text(
                                      verifiedText,
                                      style: TextStyle(
                                          color:
                                              Color.fromARGB(255, 0, 140, 255),
                                          fontSize: 10),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    CircleAvatar(
                                      maxRadius: 8,
                                      backgroundColor:
                                          Color.fromARGB(68, 244, 67, 54),
                                      child: Icon(
                                        onlyVerifiedIcon,
                                        color: Colors.red,
                                        size: 13,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                        // Product colors
                        topBottomContentSpace,
                        Container(
                          color: const Color.fromARGB(33, 158, 158, 158),
                          width: MediaQuery.of(context).size.width,
                          padding: const EdgeInsets.all(5),
                          child: Text(
                            Language.load("product_colors"),
                            style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: darkColor,
                            ),
                          ),
                        ),
                        topBottomContentSpace,
                        Container(
                          width: MediaQuery.of(context).size.width,
                          padding: const EdgeInsets.all(5),
                          child: Row(
                            children: [
                              ColorsCircle(redColor,
                                  const Color.fromARGB(80, 244, 67, 54)),
                              spaceLeftRight12,
                              ColorsCircle(Colors.blue,
                                  const Color.fromARGB(80, 54, 190, 244)),
                              spaceLeftRight12,
                              ColorsCircle(Colors.orange,
                                  const Color.fromARGB(80, 244, 177, 54)),
                              spaceLeftRight12,
                              ColorsCircle(
                                  const Color.fromARGB(255, 36, 32, 68),
                                  const Color.fromARGB(80, 67, 54, 244)),
                              spaceLeftRight12,
                              ColorsCircle(Colors.cyan,
                                  const Color.fromARGB(80, 54, 244, 235)),
                              spaceLeftRight12,
                            ],
                          ),
                        ),
                        // product size
                        topBottomContentSpace,
                        Container(
                          color: const Color.fromARGB(33, 158, 158, 158),
                          width: MediaQuery.of(context).size.width,
                          padding: const EdgeInsets.all(5),
                          child: Text(
                            Language.load("product_size"),
                            style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: darkColor,
                            ),
                          ),
                        ),
                        topBottomContentSpace,
                        Container(
                          width: MediaQuery.of(context).size.width,
                          padding: const EdgeInsets.all(5),
                          child: Row(
                            children: [
                              TextCircleAvater("12"),
                              spaceLeftRight12,
                              TextCircleAvater("12"),
                              spaceLeftRight12,
                              TextCircleAvater("12"),
                              spaceLeftRight12,
                              TextCircleAvater("12"),
                              spaceLeftRight12,
                              TextCircleAvater("12"),
                              spaceLeftRight12,
                            ],
                          ),
                        ),
                        // add to card and order button
                        topBottomContentSpace,
                        topBottomContentSpace,
                        Row(
                          children: [
                            // add to cart button
                            Expanded(
                              child: AddToCardButton(
                                cartProduct: findProductById(widget.productId),
                                updateCartItems: updateCartItems,
                                isExistInCartProduct:
                                    isExistInCart(widget.productId),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            // order now button
                            const Expanded(
                              child: OrderNowButton(),
                            ),
                          ],
                        ),
                        // tap component
                        topBottomContentSpace,
                        topBottomContentSpace,
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              // tab options
                              TabComponent(
                                width: MediaQuery.of(context).size.width - 38,
                                buttons: tabButtons,
                              ),
                            ],
                          ),
                        ),
                        topBottomContentSpace,
                        // producuct decription
                        Container(
                          color: const Color.fromARGB(33, 158, 158, 158),
                          width: MediaQuery.of(context).size.width,
                          padding: const EdgeInsets.all(5),
                          child: Text(
                            Language.load("product_description"),
                            style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: darkColor,
                            ),
                          ),
                        ),
                        topBottomContentSpace,
                        const Text(
                          "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum",
                          textAlign: TextAlign.justify,
                          style: TextStyle(),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
