import 'package:ecommerce/components/background/BgTopImage.dart';
import 'package:ecommerce/components/buttons/addToCardButton.dart';
import 'package:ecommerce/components/buttons/iconButtonComponent.dart';
import 'package:ecommerce/components/carousel/carouselComponent.dart';
import 'package:ecommerce/components/carousel/carouselIndicatorComponent.dart';
import 'package:ecommerce/components/circle/colorsCircle.dart';
import 'package:ecommerce/components/circle/textCircle.dart';
import 'package:ecommerce/components/tab/tabComponent.dart';
import 'package:ecommerce/utils/colors.dart';
import 'package:ecommerce/utils/const.dart';
import 'package:ecommerce/utils/font.dart';
import 'package:ecommerce/utils/icons.dart';
import 'package:ecommerce/utils/navigationMenu.dart';
import 'package:ecommerce/utils/string.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ProductDetails extends StatefulWidget {
  int productId;
  String productTitle;
  ProductDetails(
      {required this.productId, required this.productTitle, Key? key})
      : super(key: key);
  State<ProductDetails> createState() => _ProductDetails();
}

class _ProductDetails extends State<ProductDetails> {
  var bookMark = false;
  var isShare = false;
  var cardProduct = 1;

  var tabButtons = [
    {
      "title": "1 PIECES PRICE",
    },
    {
      "title": "1 BUNDLE PRICE",
    }
  ];

  void initState() {
    super.initState();
  }

  void increment() {
    setState(() {
      cardProduct += 1;
    });
  }

  void decrement() {
    if (cardProduct > 1) {
      setState(() {
        cardProduct -= 1;
      });
    }
  }

  List<Widget> topSlideItems = const [
    Image(image: AssetImage("assets/images/carousel/add-1.jpg")),
    Image(image: AssetImage("assets/images/carousel/add-2.jpg")),
    Image(image: AssetImage("assets/images/carousel/add-3.jpeg")),
    Image(
      image: AssetImage("assets/images/carousel/add-5.jpg"),
    ),
    Image(
      image: AssetImage("assets/images/carousel/add-7.jpg"),
    ),
  ];

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

  @override
  Widget build(BuildContext context) {
    return bgTopImage(
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () {
                shareProduct();
              },
              icon: shareIcon,
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(whiteColor),
                elevation: MaterialStateProperty.all(4),
                iconColor:
                    MaterialStateProperty.all(isShare ? blueColor : greyColor),
                shadowColor: MaterialStateProperty.all(
                  Colors.black.withOpacity(0.8),
                ),
              ),
            ),
            IconButton(
              onPressed: () {
                bookMarkProduct();
              },
              icon: bookMark ? loveFillIcon : loveIcon,
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(whiteColor),
                elevation: MaterialStateProperty.all(4),
                iconColor: MaterialStateProperty.all(lightRedColor),
                shadowColor:
                    MaterialStateProperty.all(Colors.black.withOpacity(0.8)),
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
              backgroundColor: MaterialStateProperty.all(whiteColor),
              elevation: MaterialStateProperty.all(5),
              iconColor: MaterialStateProperty.all(greyColor),
              shadowColor: MaterialStateProperty.all(
                Colors.black.withOpacity(0.8),
              ),
            ),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.all(9),
          child: SingleChildScrollView(
            child: Container(
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [CarouselIndicatorComponent(topSlideItems)],
                  ),
                  spaceTopBottom,
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
                        // Row(
                        //   children: [
                        //     IconButtonComponent(
                        //       decrement,
                        //       whiteColor,
                        //       const Icon(Icons.remove),
                        //     ),
                        //     Container(
                        //       color: Color.fromARGB(207, 255, 255, 255),
                        //       width: 50,
                        //       height: 35,
                        //       child: Center(
                        //         child: Text("$cardProduct"),
                        //       ),
                        //     ),
                        //     IconButtonComponent(
                        //       increment,
                        //       whiteColor,
                        //       const Icon(Icons.add),
                        //     ),
                        //   ],
                        // ),
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
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    CircleAvatar(
                                      maxRadius: 8,
                                      child: Icon(
                                        onlyVerifiedIcon,
                                        color: Colors.red,
                                        size: 13,
                                      ),
                                      backgroundColor:
                                          Color.fromARGB(68, 244, 67, 54),
                                    )
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
                          child: const Text(
                            "Colors",
                            style: TextStyle(
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
                                  Color.fromARGB(80, 54, 190, 244)),
                              spaceLeftRight12,
                              ColorsCircle(Colors.orange,
                                  Color.fromARGB(80, 244, 177, 54)),
                              spaceLeftRight12,
                              ColorsCircle(Color.fromARGB(255, 36, 32, 68),
                                  Color.fromARGB(80, 67, 54, 244)),
                              spaceLeftRight12,
                              ColorsCircle(Colors.cyan,
                                  Color.fromARGB(80, 54, 244, 235)),
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
                          child: const Text(
                            "Size",
                            style: TextStyle(
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
                        // topBottomContentSpace,
                        // product price
                        // topBottomContentSpace,
                        // Container(
                        //   color: const Color.fromARGB(33, 158, 158, 158),
                        //   width: MediaQuery.of(context).size.width,
                        //   padding: const EdgeInsets.all(5),
                        //   child: const Text(
                        //     "Price",
                        //     style: TextStyle(
                        //       fontSize: 15,
                        //       fontWeight: FontWeight.bold,
                        //       color: darkColor,
                        //     ),
                        //   ),
                        // ),
                        // add to card button
                        topBottomContentSpace,
                        topBottomContentSpace,
                        AddToCardButton(),
                        // tap component
                        topBottomContentSpace,
                        topBottomContentSpace,
                        Container(
                          width: MediaQuery.of(context).size.width,
                          // padding: const EdgeInsets.all(5),
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
                          child: const Text(
                            "Descriptions",
                            style: TextStyle(
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
